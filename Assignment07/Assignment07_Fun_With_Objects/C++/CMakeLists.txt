cmake_minimum_required(VERSION 3.10)
project(StrategyPatternCpp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

file(GLOB SRC
    "apps/*.cpp"
    "src/*.cpp"
)

add_executable(sort_app ${SRC})
# For MSVC, no extra flags required; CMake will generate a .sln usable in VS2022.
