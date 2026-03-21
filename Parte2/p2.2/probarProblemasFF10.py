#!/usr/bin/env python3
import subprocess, re, csv
from pathlib import Path

DOMAIN = "domain2.pddl"
TIME_LIMIT = 60

PLANNERS = {
    "seq-opt-lmcut": ["planutils", "run", "downward", "--", "--alias", "seq-opt-lmcut", "--overall-time-limit", "60"],
    "seq-opt-bjolp": ["planutils", "run", "downward", "--", "--alias", "seq-opt-bjolp", "--overall-time-limit", "60"],
    "seq-opt-fdss-2": ["planutils", "run", "downward", "--", "--alias", "seq-opt-fdss-2", "--overall-time-limit", "60"],
}

re_cost = re.compile(r"(?:Plan cost|cost)\s*[:=]?\s*([0-9]+)", re.IGNORECASE)
re_len  = re.compile(r"Plan length:\s*([0-9]+)", re.IGNORECASE)

def run(problem: str, planner_name: str, base_cmd: list[str]):
    cmd = base_cmd + [DOMAIN, problem]
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=TIME_LIMIT)
        out = (r.stdout or "") + "\n" + (r.stderr or "")

        cost_m = re_cost.search(out)
        len_m  = re_len.search(out)

        if cost_m or len_m:
            cost = int(cost_m.group(1)) if cost_m else None
            plan_len = int(len_m.group(1)) if len_m else None
            return True, None, cost, plan_len

        return False, None, None, None

    except subprocess.TimeoutExpired:
        return False, TIME_LIMIT, None, None

def main():
    problems = []
    for file in Path(".").glob("drone_problem_d1_r1_l*_p*_c*_g*_ct2_tc4*.pddl"):
        n = int(file.name.split("_l")[1].split("_")[0])
        problems.append((n, file.name))

    problems.sort(key=lambda x: x[0])

    rows = []

    for n, problem in problems:
        print(f"\n>>> n = {n} ({problem}) <<<")
        for planner_name, base_cmd in PLANNERS.items():
            ok, timeout_s, cost, plan_len = run(problem, planner_name, base_cmd)
            print(f"  {planner_name:20} ok={ok} cost={cost} plan_len={plan_len}")

            rows.append({
                "n": n,
                "problem": problem,
                "planner": planner_name,
                "ok_60s": ok,
                "timeout_60s": timeout_s if timeout_s is not None else "",
                "cost": cost if cost is not None else "",
                "plan_len": plan_len if plan_len is not None else ""
            })

    with open("punto10_optimos.csv", "w", newline="") as f:
        w = csv.DictWriter(
            f,
            fieldnames=["n", "problem", "planner", "ok_60s", "timeout_60s", "cost", "plan_len"]
        )
        w.writeheader()
        w.writerows(rows)

    print("\nOK: punto10_optimos.csv")

    print("\nResumen (máximo n resuelto por planificador):")
    for planner in PLANNERS:
        solved = [r for r in rows if r["planner"] == planner and r["ok_60s"]]
        if solved:
            best = max(solved, key=lambda r: r["n"])
            print(f"{planner:20}: n={best['n']} (coste={best['cost']}, plan_len={best['plan_len']})")
        else:
            print(f"{planner:20}: sin resultados")

if __name__ == "__main__":
    main()
