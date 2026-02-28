#!/usr/bin/env python3
import subprocess, re, csv
from pathlib import Path

DOMAIN = "domain.pddl"
GENERATOR = "generate-problem.py"
TIME_LIMIT = 60
START_N = 2
END_N = 15

SEARCHES = {
    "BFS":  ("bfs", None),
    "IDS":  ("ids", None),
    "A*":   ("astar", "hmax"),
    "GBFS": ("gbf", "hmax"),
}

re_time = re.compile(r"Search time:\s*([0-9.eE+-]+)")
re_len  = re.compile(r"Plan length:\s*(\d+)")

def gen_problem(n: int) -> str:
    subprocess.run(
        ["python3", GENERATOR, "-d", "1", "-r", "0",
         "-l", str(n), "-p", str(n), "-c", str(n), "-g", str(n)],
        check=True,
        text=True
    )
    return f"drone_problem_d1_r0_l{n}_p{n}_c{n}_g{n}_ct2.pddl"

def run(problem: str, search: str, heur: str | None):
    cmd = ["pyperplan", "-s", search]
    if heur:
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

def main():
    rows = []
    max_n = {alg: None for alg in SEARCHES}

    for n in range(START_N, END_N + 1):
        problem = gen_problem(n)
        if not Path(problem).exists():
            raise FileNotFoundError(problem)

        for alg, (search, heur) in SEARCHES.items():
            ok, t, L = run(problem, search, heur)
            rows.append({"alg": alg, "n": n, "ok_60s": ok, "time_s": t, "plan_len": L})
            if ok:
                max_n[alg] = n


    with open("13_1_all.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["alg", "n", "ok_60s", "time_s", "plan_len"])
        w.writeheader()
        w.writerows(rows)

    solved = {}
    for r in rows:
        if r["ok_60s"]:
            solved[(r["alg"], r["n"])] = (r["time_s"], r["plan_len"])

    with open("13_1_max.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["alg", "max_n_under_60s", "time_s", "plan_len"])
        w.writeheader()
        for alg in SEARCHES:
            nmax = max_n[alg]
            if nmax is None:
                w.writerow({"alg": alg, "max_n_under_60s": None, "time_s": None, "plan_len": None})
            else:
                t, L = solved.get((alg, nmax), (None, None))
                w.writerow({"alg": alg, "max_n_under_60s": nmax, "time_s": t, "plan_len": L})

    print("OK: 13_1_all.csv y 13_1_max.csv (con plan_len)")

if __name__ == "__main__":
    main()
