# Reflection & Comparison – Strategy Pattern in C++ and OCaml

## My Implementation Experience

For this assignment, I implemented the Strategy Pattern in both C++ and OCaml. In C++, I used an abstract base class `SortStrategy` and three derived classes (`QuickSort`, `MergeSort`, and `BubbleSort`). The `SortContext` class holds a pointer to the current strategy, and I also added support for inline lambda strategies using `std::function`. I tested the code with different inputs and runtime strategy selection.

In OCaml, I explored two approaches. First, I wrote a higher-order function `sort_with` that takes a sorting function as a parameter. Then, I implemented a functor-based version, where the context module is parameterized by a module that provides a `sort` function. Both approaches replicate the same behavior as the C++ version, but in a purely functional style.

---

## Comparing Strategy Selection: OOP vs FP

- **OOP (C++)**: Strategy selection works through **polymorphism**. The context calls a virtual method on the strategy object, and we can switch behavior at runtime by changing which object the context holds.  
- **FP (OCaml)**: Strategies are **first-class functions**. Passing a function to the context achieves the same effect without objects or inheritance. We can swap behaviors simply by passing a different function.

---

## Functions vs Objects

- Functions-as-values in OCaml are lightweight and composable. They make swapping behavior trivial and support closures.  
- Objects in C++ encapsulate both data and behavior, enabling polymorphic hierarchies and dynamic dispatch, which is useful when strategies share state or need runtime flexibility.

---

## OCaml Modules and Functors vs Classes

OCaml’s modules and functors allow code organization and parameterization similar to classes. Functors let me inject different strategies at compile time, while classes support runtime polymorphism. While the mechanisms differ, both approaches allow reusing and swapping behavior effectively.

---

## Personal Reflection

Doing this assignment helped me understand how **design patterns translate across paradigms**. Implementing the same pattern in C++ and OCaml highlighted the differences in abstraction: objects vs functions, runtime vs compile-time flexibility, and the way each language encourages different design decisions. Everything here was implemented, tested, and written by me personally.
