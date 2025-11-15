Assignment07_Fun_With_Objects

This archive contains:

- C++/ : C++ implementation (headers, sources, app).
  - Build with CMake (cross-platform) or use the provided Makefile from Visual Studio Developer Command Prompt.
  - Example (Visual Studio dev prompt): cl /EHsc /std:c++17 /Iinclude apps/main.cpp src/QuickSort.cpp src/MergeSort.cpp src/BubbleSort.cpp /Fe:sort_app.exe

- ocaml/ : OCaml implementation (strategies, context examples)
  - If you use WSL or Linux, install dune/opam and run `dune exec ./context_fun.exe`
  - Or compile with ocamlc manually.

- docs/report.md : Reflection and comparison (for submission)

Notes for Windows (Visual Studio 2022):
- Open "x64 Native Tools Command Prompt for VS 2022" (or the Developer Command Prompt) to ensure `cl` is available.
- From the C++ directory run: cl /EHsc /std:c++17 /Iinclude apps/main.cpp src/QuickSort.cpp src/MergeSort.cpp src/BubbleSort.cpp /Fe:sort_app.exe

Notes for WSL:
- Use the included CMakeLists or compile with g++:
  mkdir -p build && cd build
  cmake ..
  cmake --build . --config Release

