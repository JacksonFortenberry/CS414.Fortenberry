CXX=cl
CXXFLAGS=/std:c++17
SRCS=apps/main.cpp src/QuickSort.cpp src/MergeSort.cpp src/BubbleSort.cpp
TARGET=sort_app.exe

# This simple Makefile assumes Visual Studio's Developer Command Prompt (cl available).
all:
	cl /EHsc /std:c++17 /Iinclude $(SRCS) /Fe:$(TARGET)

clean:
	del $(TARGET)
