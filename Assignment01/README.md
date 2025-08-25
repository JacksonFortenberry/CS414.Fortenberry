# Assignment01 – Question 1 (Peano Arithmetic in OCaml)

This assignment implements Peano naturals with addition, multiplication, division (quotient), and remainder using **pure structural recursion** (no mutation).

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

Expected output:
Test Successful … 6 tests run.

Design Notes

add: recursive on the first argument, add (S x) y = S (add x y).

mul: defined by repeated addition, mul (S x) y = add y (mul x y).

sub: subtraction clamped at 0 (Z).

div: quotient by repeated subtraction (div Z y = Z, div x Z raises).

rem: remainder by repeated subtraction (rem x y < y).

All functions are structural recursive only, no mutation.

Proof Sketches
Addition

Base: add Z y = y.

Step: Assume add x y is correct. Then
add (S x) y = S (add x y), which preserves correctness.

Multiplication

Base: mul Z y = Z.

Step: Assume mul x y is correct. Then
mul (S x) y = add y (mul x y), which agrees with the definition.

Thus both follow Peano’s axioms.

Sources / Acknowledgment

I consulted ChatGPT to help structure the Dune project and check that my recursive definitions matched Peano’s axioms.

Prompt used:

“Provide OCaml functions with two variables that implement Peano’s axioms for multiplication and division.”

I used ChatGPT
I reviewed, rewrote, and tested the functions myself to ensure they are correct, purely structural, and consistent with lecture notes.
This submission contains only immutable, recursive definitions that respect Peano’s axioms.
 
