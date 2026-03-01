#!/usr/bin/env python3
import subprocess, re, csv
from pathlib import Path

DOMAIN = "domain.pddl"
TIME_LIMIT = 60
N_MAX = 7

SEARCHES = ["gbf", "ehs"]               
HEURISTICS = ["hmax", "hadd", "hff", "landmark"]  

re_time = re.compile(r"Search time:\s*([0-9.eE+-]+)")
re_len  = re.compile(r"Plan length:\s*(\d+)")

def run(problem: str, search: str, heur: str):
    cmd = ["pyperplan", "-s", search, "-H", heur, DOMAIN, problem]
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
    problem = f"drone_problem_d1_r0_l{N_MAX}_p{N_MAX}_c{N_MAX}_g{N_MAX}_ct2.pddl"
    if not Path(problem).exists():
        raise FileNotFoundError(f"No existe {problem}. Genera primero ese tamaño con generate-problem.py")

    rows = []
    for s in SEARCHES:
        for h in HEURISTICS:
            ok, t, L = run(problem, s, h)
            rows.append({"n": N_MAX, "problem": problem, "search": s, "heuristic": h,
                         "ok_60s": ok, "time_s": t, "plan_len": L})

    with open("13_2_table.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["n","problem","search","heuristic","ok_60s","time_s","plan_len"])
        w.writeheader()
        w.writerows(rows)

    print("OK: 13_2_table.csv")

if __name__ == "__main__":
    main()
