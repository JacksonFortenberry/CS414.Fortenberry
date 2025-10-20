# CS 414 – Assignment 05

**Exploring Questions of Type**

---

## Question 1 – C++ `std::variant` and Pattern Matching

File: **`bst_variant.cpp`**

This program uses the C++17 `std::variant` type to build a binary search tree similar to how you’d define it in OCaml with variants.
Each node is either:

* `Empty` – represents an empty tree
* `Node` – stores a value and pointers to left/right subtrees

The code also includes functions for:

* **inorder traversal** (left → value → right)
* **preorder traversal** (value → left → right)
* **postorder traversal** (left → right → value)

It uses `std::visit` with small visitor structs to imitate OCaml-style pattern matching.

Run it with any C++17 compiler, for example:

```bash
g++ -std=c++17 bst_variant.cpp -o bst_variant
./bst_variant
```

Expected output:

```
Inorder: 1 3 4 5 7
Preorder: 5 3 1 4 7
Postorder: 1 4 3 7 5
```

---

## Question 2 – OCaml Parametric Zipper List

File: **`zipper_list.ml`**

This OCaml file defines a **parametric zipper list** type:

```ocaml
type 'a zipper = {
  left : 'a list;
  focus : 'a option;
  right : 'a list;
}
```

It supports the following operations:

* `empty` – creates an empty zipper list
* `is_empty` – checks if the list is empty
* `move_left` / `move_right` – moves the focus one element
* `push_front` / `push_back` – adds elements before or after the focus
* `focus` – returns the current focused element

You can test it by running:

```bash
ocaml zipper_list.ml
```

Example output:

```
Focus is 2
```

---

## Notes

* Both parts are meant to show how type systems in C++ and OCaml can express similar ideas (variants, parametric types).
* The C++ version mimics OCaml’s `match` expressions using `std::visit`.
* The OCaml version shows how to define a generic data structure with a type variable `'a`.

---


