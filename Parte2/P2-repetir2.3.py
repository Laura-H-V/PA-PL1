#!/usr/bin/env python3
import subprocess, re, csv
from pathlib import Path

DOMAIN = "domain.pddl"
GENERATOR = "generate-problem.py"
TIME_LIMIT = 60

N = 6

# 1 dron, 1 transportador, capacidad 4
D = 1
R = 1
CAP = 4

ADMISSIBLE_HEURISTICS = ["blind", "hmax", "lmcut"]
BASELINE_SEARCHES = ["bfs", "ids"]
ASTAR_SEARCH = "astar"

re_time = re.compile(r"Search time:\\s*([0-9.eE+-]+)")
re_len  = re.compile(r"Plan length:\\s*(\\d+)")

def gen_problem(n: int) -> str:
    problem = f"drone_problem_d{D}_r{R}_l{n}_p{n}_c{n}_g{n}_ct2_tc{CAP}.pddl"
    cmd = [
        "python3", GENERATOR,
        "-d", str(D),
        "-r", str(R),
        "-l", str(n), "-p", str(n), "-c", str(n), "-g", str(n),
        "--transporter-capacity", str(CAP)
    ]
    print("Generando problema:", " ".join(cmd))
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        print("ERROR al generar el problema")
        print("STDOUT:")
        print(r.stdout)
        print("STDERR:")
        print(r.stderr)
        raise RuntimeError("generate-problem.py terminó con error")
    if not Path(problem).exists():
        raise FileNotFoundError(f"No se ha creado {problem}")
    return problem

def run(problem: str, search: str, heur: str | None):
    cmd = ["pyperplan", "-s", search]
    if heur is not None:
        cmd += ["-H", heur]
    cmd += [DOMAIN, problem]

    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=TIME_LIMIT)
        out = (r.stdout or "") + "\\n" + (r.stderr or "")
        t = re_time.search(out)
        L = re_len.search(out)
        if t and L:
            return True, float(t.group(1)), int(L.group(1))
        return False, None, None
    except subprocess.TimeoutExpired:
        return False, None, None

def main():
    problem = gen_problem(N)

    rows = []

    # BFS e IDS
    for s in BASELINE_SEARCHES:
        ok, t, L = run(problem, s, None)
        rows.append({
            "n": N, "problem": problem,
            "search": s, "heuristic": None,
            "ok_60s": ok, "time_s": t, "plan_len": L
        })

    # A* con heurísticas admisibles
    for h in ADMISSIBLE_HEURISTICS:
        ok, t, L = run(problem, ASTAR_SEARCH, h)
        rows.append({
            "n": N, "problem": problem,
            "search": ASTAR_SEARCH, "heuristic": h,
            "ok_60s": ok, "time_s": t, "plan_len": L
        })

    csv_name = "13_3_table_transporter_n6.csv"
    with open(csv_name, "w", newline="") as f:
        w = csv.DictWriter(
            f,
            fieldnames=["n","problem","search","heuristic","ok_60s","time_s","plan_len"]
        )
        w.writeheader()
        w.writerows(rows)

    print(f"OK: resultados n={N} en {csv_name}")

if __name__ == "__main__":
    main()
