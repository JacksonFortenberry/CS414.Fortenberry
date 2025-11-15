#pragma once
#include <vector>
#include <chrono>

using Clock = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double, std::milli>;

inline Duration time_ms(Clock::time_point start, Clock::time_point end) {
    return std::chrono::duration_cast<Duration>(end - start);
}
