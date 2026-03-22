import subprocess
from pathlib import Path

DOMAIN = "domain.pddl"
GENERATOR = "generate-problem.py"
TIME_LIMIT = 60
N_MIN = 2
N_MAX = 35
NUM_DRONES = 5
TRANSPORTER_CAPACITY = 4

PLANNER_CMD = ["planutils", "run", "optic"]

def generate_problem(d: int, r: int, n: int):
    problem_name = f"drone_problem_d{d}_r{r}_l{n}_p{n}_c{n}_g{n}_ct2_tc{TRANSPORTER_CAPACITY}.pddl"

    cmd = [
        "python3", GENERATOR,
        "-d", str(d),
        "-r", str(r),
        "-l", str(n),
        "-p", str(n),
        "-c", str(n),
        "-g", str(n),
        "--transporter-capacity", str(TRANSPORTER_CAPACITY),
    ]

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"\nError generando {problem_name}")
        print(result.stderr)
        return None

    if not Path(problem_name).exists():
        print(f"\nNo se ha generado {problem_name}")
        return None

    return problem_name

def run_optic(problem: str):
    cmd = PLANNER_CMD + [DOMAIN, problem]

    try:
        r = subprocess.run(cmd, text=True, timeout=TIME_LIMIT)
        return r.returncode == 0, f"returncode={r.returncode}"

    except subprocess.TimeoutExpired as e:
        return "timeout", ""

def main():
    d = NUM_DRONES
    r = NUM_DRONES

    print(f"\n=== Probando d={d}, r={r} ===")

    for n in range(N_MIN, N_MAX + 1):
        print(f"\n########## n = {n} ##########")

        problem = generate_problem(d, r, n)
        if problem is None:
            print("No se pudo generar el problema.")
            continue

        result, out = run_optic(problem)

        if result == True:
            print("Resultado: RESUELTO")
            print(out)
        elif result == "timeout":
            print("Resultado: TIMEOUT (> 60 s)")
        else:
            print("Resultado: NO RESUELTO / ERROR")
            print(out)

if __name__ == "__main__":
    main()
