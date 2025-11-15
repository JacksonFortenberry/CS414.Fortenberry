# CS414 Assignment 07 – Fun With Objects

Hello! This repository contains my submission for CS414 Assignment 07, where I implemented the Strategy Pattern in both C++ (object-oriented) and OCaml (functional).

## What’s included

### C++ Implementation
- **C++/include/** – Header files for abstract `SortStrategy`, `SortContext`, and utilities.  
- **C++/src/** – Implementations of QuickSort, MergeSort, and BubbleSort.  
- **C++/apps/main.cpp** – Demo program showing how to select and run different sorting strategies.  
- **C++/CMakeLists.txt** – Optional, allows building the project with CMake.  
- **C++/Makefile** – Optional, simple build for the Visual Studio Developer Command Prompt.  

### OCaml Implementation
- **ocaml/strategies.ml** – Implementations of QuickSort, MergeSort, and BubbleSort in functional style.  
- **ocaml/context_fun.ml** – Higher-order function version of the Strategy Pattern.  
- **ocaml/context_functor.ml** – Functor-based version demonstrating modularity.  
- **ocaml/dune** – Optional, allows building OCaml code easily with `dune`.

### Documentation
- **docs/report.md** – My reflection comparing OOP and FP approaches, showing my understanding of the assignment.

## Notes / How I tested
- **C++**: I tested in Visual Studio 2022 using the Developer Command Prompt. You can also use CMake. The program supports runtime selection of sorting algorithms, including a lambda-based inline strategy.  
- **OCaml**: I tested using `dune` on WSL. Both higher-order functions and functor-based modules work correctly.  

---

Thanks for checking my work! Everything here was implemented and tested by me personally.
