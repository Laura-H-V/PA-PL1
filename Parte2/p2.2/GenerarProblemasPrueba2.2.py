
import subprocess
import sys

GENERATOR = "generate-problem2.py"

for n in range(1, 30):
    cmd = [
        "python3", GENERATOR,
        "-d", "1",           # 1 dron
        "-r", "1",           # 1 transportador  
        "-l", str(n),        # n localizaciones
        "-p", str(n),        # n personas
        "-c", str(n),        # n cajas
        "-g", str(n),        # n goals
        "--transporter-capacity", "4"  # capacidad fija 4
    ]
    
    print(f"n={n}: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode == 0:
        problem = f"drone_problem_d1_r1_l{n}_p{n}_c{n}_g{n}_ct2_tc4.pddl"
        print(f"Creado: {problem}")
    else:
        print(f"ERROR")
    print()

