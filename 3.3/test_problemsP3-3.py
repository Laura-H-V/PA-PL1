#!/usr/bin/env python3
import subprocess, re, csv
from pathlib import Path

DOMAIN = "domain.pddl"
GENERATOR = "generate-problem.py"
TIME_LIMIT = 60
START_N = 2
END_N = 6

ADMISSIBLE_HEURISTICS = ["blind", "hmax", "lmcut"]


BASELINE_SEARCHES = ["bfs", "ids"]
ASTAR_SEARCH = "astar"

re_time = re.compile(r"Search time:\s*([0-9.eE+-]+)")
re_len  = re.compile(r"Plan length:\s*(\d+)")

def gen_problem(n: int) -> str:
    subprocess.run(
        ["python3", GENERATOR, "-d","1","-r","0","-l",str(n),"-p",str(n),"-c",str(n),"-g",str(n)],
        check=True, text=True
    )
    return f"drone_problem_d1_r0_l{n}_p{n}_c{n}_g{n}_ct2.pddl"

def run(problem: str, search: str, heur: str | None):
    cmd = ["pyperplan", "-s", search]
    if heur is not None:
        cmd += ["-H", heur]
    cmd += [DOMAIN, problem]

    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=TIME_LIMIT)
        out = (r.stdout or "") + "\n" + (r.stderr or "")
        t = re_time.search(out)
        L = re_len.search(out)
        if t and L:
            return True, float(t.group(1)), int(L.group(1))
        return False, None, None
    except subprocess.TimeoutExpired:
        return False, None, None

def find_max_n_astar_hmax():
    max_n = None
    max_problem = None

    for n in range(START_N, END_N + 1):
        problem = gen_problem(n)
        if not Path(problem).exists():
            raise FileNotFoundError(problem)

        ok, t, L = run(problem, ASTAR_SEARCH, "hmax")
        if ok:
            max_n = n
            max_problem = problem
        else:
            pass

    return max_n, max_problem

def main():
    max_n, problem = find_max_n_astar_hmax()
    if problem is None:
        print("A* con hmax no resolvió ningún tamaño en <=60s")
        return

    rows = []


    for s in BASELINE_SEARCHES:
        ok, t, L = run(problem, s, None)
        rows.append({
            "n": max_n, "problem": problem,
            "search": s, "heuristic": None,
            "ok_60s": ok, "time_s": t, "plan_len": L
        })

    for h in ADMISSIBLE_HEURISTICS:
        ok, t, L = run(problem, ASTAR_SEARCH, h)
        rows.append({
            "n": max_n, "problem": problem,
            "search": ASTAR_SEARCH, "heuristic": h,
            "ok_60s": ok, "time_s": t, "plan_len": L
        })

    with open("13_3_table.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["n","problem","search","heuristic","ok_60s","time_s","plan_len"])
        w.writeheader()
        w.writerows(rows)

    print(f"OK: problema elegido (max A*+hmax en 60s) = n={max_n} -> {problem}")
    print("OK: resultados en 13_3_table.csv")

if __name__ == "__main__":
    main()
