This assignment implements Peano naturals with addition, multiplication, division (quotient), and remainder using **pure structural recursion** (no mutation).
## Build & Test

### Prereqs
- OCaml (≥ 5.0), dune, opam
- `alcotest` for unit tests

### Setup (local switch recommended)
```bash
opam switch create . ocaml-base-compiler.5.1.1 --no-install
eval "$(opam env)"
opam install dune alcotest
dune build
dune runtest


## 3) Install compiler & deps in this project
```bash
# Still inside Assignment01/
opam switch create . ocaml-base-compiler.5.1.1 --no-install
eval "$(opam env)"
opam install dune alcotest -y