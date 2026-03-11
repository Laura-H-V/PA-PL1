#!/usr/bin/env python3
import subprocess
import sys

DOMAIN = "domain2.pddl"
GENERATOR = "generate-problem2.py"

# 1 dron, 1 transportador, capacidad 4 (fijo)
D = 1
R = 1
CAP = 4

# Generar 20 problemas: n = 2 a 21
for n in range(2, 22):
    cmd = [
        "python3", GENERATOR,
        "-d", str(D),
        "-r", str(R),
        "-l", str(n),
        "-p", str(n),
        "-c", str(n),
        "-g", str(n),
        "--transporter-capacity", str(CAP)
    ]
    
    print(f"Generando n={n}: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode == 0:
        problem = f"drone_problem_d{D}_r{R}_l{n}_p{n}_c{n}_g{n}_ct2_tc{CAP}.pddl"
        print(f"  OK: {problem}")
    else:
        print(f"  ERROR:")
        print(f"    STDOUT: {result.stdout}")
        print(f"    STDERR: {result.stderr}")

print("\n Generados 20 problemas (n=2 a n=21)")
