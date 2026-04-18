# Optimisation Problems — IBM CPLEX OPL

![IBM CPLEX](https://img.shields.io/badge/IBM-CPLEX-054ADA?style=flat)
![OPL](https://img.shields.io/badge/Language-OPL-6a1b9a?style=flat)
![Problems](https://img.shields.io/badge/Problems-LP%20%7C%20BIP%20%7C%20Network-00695c?style=flat)
![Module](https://img.shields.io/badge/Module-Prescriptive%20Analytics-e65100?style=flat)

Three distinct optimisation problems formulated mathematically and solved using IBM CPLEX OPL, covering continuous linear programming, binary integer programming, and network flow. Each problem includes full mathematical formulation, modular OPL code, and sensitivity analysis of the optimal solution.

## Problem 1 — The Dietitian's Problem (LP)

Minimise-cost lunch menu for a university football team satisfying six nutritional constraints (calories, iron, fat, protein, carbohydrates, cholesterol) across seven food items. Data read from Excel via `SheetConnection`.

- Optimal solution: Fried Beans (1.667 lbs), Potatoes (0.304 lbs), Milk 2% (1.500 lbs) at $2.87/serving
- Binding constraints: calorie lower bound and cholesterol upper bound drive food exclusions
- Sensitivity analysis: Fried Beans cost coefficient can increase 85% before leaving the optimal basis

## Problem 2 — Student-Project Assignment (BIP)

Assign 28 engineering students to 8 projects (3–4 students each) to minimise total preference rank score. Solved as a Binary Integer Program using CPLEX Branch and Bound; results written directly to Excel via `SheetWrite`.

- Optimal total rank score: 35 — 22/28 students (78.6%) assigned to their 1st choice
- 100% of students placed within their top-3 preference
- Single 3rd-choice assignment (Truman → ED) driven by group-size constraints on lower-demand projects

## Problem 3 — Shortest Path (Network Flow LP)

Find the minimum-time walking route across a 14-node, 25-arc hospital campus network from the Administration Block (node 3) to Nightingale Ward (node 8). Modelled as a flow-balance LP; each undirected arc represented as two directed arcs.

- Optimal path: 3 → 1 → 4 → 5 → 8 = 64 minutes
- Next-best alternatives both take 65 minutes; sensitivity ranges confirm robustness of solution
- Source/sink parameterised in the `.dat` file — any origin-destination pair solvable without modifying the model

## Repo structure

```
problem1-dietitian/    — dietitian.mod, dietitian.dat, dietitian_data.xlsx
problem2-assignment/   — assignment.mod, assignment.dat, assignment_results.xlsx
problem3-shortestpath/ — shortestpath.mod, shortestpath.dat
```

## Tech stack

IBM CPLEX Optimization Studio 22.1.2 · OPL · Excel (SheetConnection / SheetWrite)
