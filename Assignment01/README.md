Awesome—here’s your README updated to **include Question 3** while keeping everything you already had for **Questions 1 & 2**. You can paste this straight into `README.md` in your repo.

---

# Assignment01 – Question 1 (Peano Arithmetic in OCaml)

This assignment implements Peano naturals with addition, multiplication, division (quotient), and remainder using **pure structural recursion** (no mutation).

# CS414 – Assignment01 • Question 2

## Overview

Implements a **binary tree** in OCaml with two recursive functions:

* `prune : 'a tree -> 'a tree`
  Returns a new tree with all **original leaves** removed.
* `level_traversal : 'a tree -> 'a list`
  Breadth-first (level-order) traversal returning a **flat list** left-to-right.

Tree type:

```ocaml
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree
```

## Build & Test

### Prerequisites

* OCaml (≥ 5.0)
* dune
* opam
* `alcotest` (for unit tests)

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
```

### Example Output

```
Question 1
Test Successful … 6 tests run.
Output for Question1:
9 / 4 = 2, 9 % 4 = 1
3 * 5 = 15
7 / 2 = 3, 7 % 2 = 1

Question 2
Output:
Level order (original): [1; 2; 3; 4; 5; 6]
Level order (after prune): [1; 2; 3]
Single-node level order: [42]
Single-node after prune (should be empty): []
```

---

# CS414 – Assignment01 • Question 3 (General k-ary Search Tree)

## Overview

Implements a **general search tree** whose **internal node keys act as separation values** for the subtrees. If a node has `m` keys, it has `m+1` children. The invariant:

* `keys` are strictly increasing (no duplicates)
* `List.length children = List.length keys + 1`
* For keys = `[k0; k1; ...; k_{m-1}]` and children = `[c0; c1; ...; c_m]`:

  * all values in `c0 < k0`
  * all values in `c1` are between `k0` and `k1`
  * …
  * all values in `c_m > k_{m-1}`

Polymorphic type:

```ocaml
type 'a gtree =
  | Empty
  | Node of {
      keys     : 'a list;      (* strictly increasing *)
      children : 'a gtree list; (* length = length keys + 1 *)
    }
```

> In the code, this is implemented as module `GTree` with type `'a t` and constructors `Empty | Node { keys; children }`.

## Implemented Functions

* `height : 'a t -> int`
  Structural height (`Empty = 0`, node = `1 + max child heights`).

* **Higher-order traversals (fold and list versions):**

  * `inorder_fold  : ('acc -> 'a -> 'acc) -> 'acc -> 'a t -> 'acc`
  * `preorder_fold : ('acc -> 'a -> 'acc) -> 'acc -> 'a t -> 'acc`
  * `postorder_fold: ('acc -> 'a -> 'acc) -> 'acc -> 'a t -> 'acc`
  * `inorder  : 'a t -> 'a list`
  * `preorder : 'a t -> 'a list`
  * `postorder: 'a t -> 'a list`

  In-order generalization interleaves children and keys:
  `c0, k0, c1, k1, ..., c_{m-1}, k_{m-1}, c_m`.

* `insert : ('a -> 'a -> int) -> 'a -> 'a t -> 'a t`
  Pure, duplicate-safe insert that **preserves the invariant**.
  (This is **not** a B-tree rebalance; it’s a straightforward k-ary search-tree insert. If equal key found, tree unchanged.)

* `valid_shape : ('a -> 'a -> int) -> 'a t -> bool`
  Lightweight shape/invariant check: `children = keys + 1` and keys strictly increasing, recursively.

## Example Program Output

Running the demo driver (`src/main.ml`) that inserts:
`[5; 2; 8; 1; 3; 7; 9; 6; 5]` (the last `5` is a duplicate) prints:

```
height = 4
inorder   = [1, 2, 3, 5, 6, 7, 8, 9]
preorder  = [5, 2, 1, 3, 8, 7, 6, 9]
postorder = [1, 3, 2, 6, 7, 9, 8, 5]
valid_shape? true
```

## Design Notes

* **Immutability only**: no mutation, arrays, or refs; modules/records/lists only.
* **Invariant preservation**:

  * New leaf is always `Node { keys = [x]; children = [Empty; Empty] }`.
  * Insert changes exactly **one** child; lengths remain consistent.
  * No duplicates: equality at a node → return the same tree.
* **Higher-order traversals** expose both folds and easy list-building variants.

## Proof Sketches

* **Height**: `Empty -> 0`; otherwise `1 + max child`. Induction on structure.
* **Traversals**: Folds traverse exactly once and in required order (pre/in/post). Induction on node shape.
* **Insert preserves invariant**:

  * Base: inserting into `Empty` returns a leaf with `keys=[x]` and `children=[Empty; Empty]` (size relation holds).
  * Step: unique descent index `i` by binary partition (`keys` strictly increasing). Recursively preserves invariant in child `i`; the parent’s `keys` unchanged, `children` replaced at `i` only, keeping `|children|=|keys|+1`.
    No duplicates added (checked at node before descending).

---

## Project Layout

```
Assignment01/
  dune-project
  src/
    dune
    main.ml
    question1.ml
    question2.ml
    question3.ml   <-- (GTree implementation)
  test/
    # (optional) add Alcotest suites here
```

### `dune-project`

```text
(lang dune 3.11)
(name assignment01)
```

### `src/dune`

List **all** modules you have in `src/`:

```lisp
(library
 (name assignment01)
 (modules question1 question2 question3 main))
```

### Build / Run

```bash
dune build
dune exec ./src/main.exe
dune runtest     # if/when tests are added
```

---

## Sources / Acknowledgment

* Code style and recursion patterns inspired by **class lectures**.
* I consulted **ChatGPT** to help structure the Dune project and to double-check recursive definitions for:

  * Peano arithmetic (Q1),
  * Binary tree prune and level traversal (Q2),
  * General k-ary search tree (Q3).
* I reviewed, rewrote, and tested all functions to ensure they are purely structural, recursive, and consistent with course requirements.
* This submission contains only immutable, recursive definitions that respect the course’s functional programming guidelines
  
