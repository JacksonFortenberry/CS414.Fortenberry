# Assignment01 – Question 1 (Peano Arithmetic in OCaml)

This assignment implements Peano naturals with addition, multiplication, division (quotient), and remainder using **pure structural recursion** (no mutation).

# CS414 – Assignment01 • Question 2

## Overview
Implements a **binary tree** in OCaml with two recursive functions:

- `prune : 'a tree -> 'a tree`  
  Returns a new tree with all **original leaves** removed.
- `level_traversal : 'a tree -> 'a list`  
  Breadth-first (level-order) traversal returning a **flat list** left-to-right.

Tree type:
```ocaml
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

---

## Build & Test

### Prerequisites
- OCaml (≥ 5.0)
- dune
- opam
- `alcotest` (for unit tests)

### Setup (local switch recommended)
```bash
# Create a local switch with OCaml 5.1.1
opam switch create . ocaml-base-compiler.5.1.1 --no-install
eval "$(opam env)"

# Install dependencies
opam install dune alcotest -y

# Build and run tests
dune build
dune runtest

Question 1
Test Successful … 6 tests run.
Output for Question1:
9 / 4 = 2, 9 % 4 = 19 / 4 = 2, 9 % 4 = 1
Question 2
OUtput:
Level order: 1 2 3 4 5 6
After prune: 1 2 3

## Question 1 – Peano Arithmetic

### Design Notes
- **add**: recursive on the first argument, `add (S x) y = S (add x y)`.
- **mul**: defined by repeated addition, `mul (S x) y = add y (mul x y)`.
- **sub**: subtraction clamped at 0 (`Z`).
- **div**: quotient by repeated subtraction (`div Z y = Z`, `div x Z` raises).
- **rem**: remainder by repeated subtraction (`rem x y < y`).

All functions are **structurally recursive only**, with no mutation.

### Proof Sketches
**Addition**
- Base: `add Z y = y`.
- Step: Assume `add x y` is correct. Then  
  `add (S x) y = S (add x y)`, which preserves correctness.

**Multiplication**
- Base: `mul Z y = Z`.
- Step: Assume `mul x y` is correct. Then  
  `mul (S x) y = add y (mul x y)`, which agrees with the definition.

Thus both addition and multiplication follow Peano’s axioms.

---

## Question 2 – Binary Tree: Prune and Level Traversal

### Design Notes
- **Tree type**:  
  ```ocaml
  type 'a tree =
    | Leaf
    | Node of 'a * 'a tree * 'a tree

Sources / Acknowledgment:
Code style and recursion patterns inspired by class lectures.
I consulted ChatGPT to help structure the Dune project and to double-check recursive definitions for both Peano arithmetic and tree traversal.
Prompts included:
“Provide OCaml functions with two variables that implement Peano’s axioms for multiplication and division.”
“Implement binary tree prune and level traversal functions in OCaml.”
I reviewed, rewrote, and tested all functions myself to ensure they are purely structural, recursive, and consistent with lecture notes.
This submission contains only immutable, recursive definitions that respect the course’s functional programming requirements.
