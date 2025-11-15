# Reflection & Comparison: Strategy Pattern in C++ vs OCaml

## Strategy selection: OOP vs FP

**OOP (C++):** the Strategy Pattern uses an abstract interface (class with virtual functions) and concrete implementations (derived classes). A context object holds a pointer/reference to the base and calls the polymorphic method. Selection occurs by substituting which concrete object the context refers to at runtime.

**FP (OCaml):** instead of objects, algorithms are values (functions). The context is either a higher-order function that accepts a function, or a module functor parameterized by a module implementing a `sort` function. Selection happens by passing a different function (or instantiating the functor with a different module).

## Functions-as-values vs objects-as-behaviors

- Functions-as-values are lightweight: they carry code and can capture environment (closures). They are excellent for small, composable strategies and make swapping behavior trivial.
- Objects encapsulate both data and behavior and support subtyping and dynamic dispatch. Objects are useful where strategies share state or require polymorphic hierarchies and binary compatibility.

## OCaml modules & functors ≈ classes

OCaml modules and functors provide a way to package code and create parameterized modules. Functors (modules that accept modules) allow a form of compile-time dependency injection. While not identical to classes, functors allow similar reuse and organization patterns: you can create different `SORT` modules and instantiate `SortContext` for each. The main difference is that functor instantiation is resolved at compile time (static), whereas classes/objects support runtime polymorphism.

## What is provided

- C++ implementation with QuickSort, MergeSort, BubbleSort, a SortContext supporting object and lambda strategies, CMake and a simple Makefile for MSVC.
- OCaml implementations and a simple dune file for building with dune (or compile manually).
- README and instructions inside the ZIP.
