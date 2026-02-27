#!/usr/bin/env python3
import os

# Rango de tamaños que queremos probar
for SIZE in range(2, 61):  
    print(f"\n=== Generando problema tamaño {SIZE} ===")
    # Genera el problema con el generador
    os.system(f"python3 generate-problem.py -d 1 -r 0 -l {SIZE} -p {SIZE} -c {SIZE} -g {SIZE}")
    
    
    # Nombre del archivo generado por el script
    problem_file = f"drone_problem_d1_r0_l{SIZE}_p{SIZE}_c{SIZE}_g{SIZE}_ct2.pddl"
    
    print(f"=== Ejecutando FF para {problem_file} ===")
    # Ejecuta FF y mide el tiempo con planutils
    os.system(f"planutils run ff domain.pddl {problem_file}")
    
    print("-" * 40)