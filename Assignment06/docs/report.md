# Assignment 06 – Monads in OCaml and C++

## Question 1 – OCaml Monads
I implemented the `MONAD` signature with `OptionM`, `ResultM`, and `ListM`, and added the `Make_infix` module to get the `>>=` and `let*` operators.  
The `let*` syntax really simplified things — chaining computations felt much cleaner.  
Running with `dune exec ./main.exe` gave the expected results for all three monads.

---

## Question 2 – Tiny Optional Helpers (C++)
I added the `maybe_bind` and `maybe_return` helpers into `monads.cpp`.  
At first the nested lambdas looked confusing, but then I realized they’re just what OCaml’s `let*` hides behind the scenes.  

Example:
```ocaml
let* a = safe_div x 2 in ...
````

translates to:

```ocaml
safe_div x 2 >>= fun a -> ...
```

And in C++:

```cpp
maybe_bind(safe_div(x, 2), [&](int a) {
    ...
});
```

Same logic — just a bit more typing.

---

## Question 3 – Minimal Result<T, E>

I created a small `Result<T, E>` class using `std::variant`.
Functions like `ok`, `err`, `bind`, and `map` were short one-liners.
The cool part was how the validation chain (`parse_int ▸ nonneg ▸ bounded100`) short-circuits automatically at the first error — no `if` statements needed.

---

## Question 4 – Safe Division Pipelines

I added:

* `triple_div(x, y, z)` → does `(x / y) / z`
* `quad_div(x, y, z)` → does `(x / y) / z / 2`

In OCaml, I used the `let*` syntax, and in C++ I reused `maybe_bind`.
When I ran the tests, everything printed “All checks passed.”

---

## Reflection

This assignment really helped me see how OCaml and C++ can both use monads to handle computations with context.
OCaml hides most of the structure with nice syntax, while C++ makes you write it all out — but the pattern is exactly the same.
After finishing both, the concept of monads finally clicked for me.

```
