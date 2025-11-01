#include <optional>
#include <iostream>
#include <cassert>

/* re-use the helper from Question 2 */
template <class A, class F>
auto maybe_bind(const std::optional<A>& mx, F f) -> decltype(f(*mx)) {
    if (!mx) return decltype(f(*mx)){};
    return f(*mx);
}
std::optional<int> safe_div(int a, int b) {
    if (b == 0) return std::nullopt;
    return a / b;
}

/* ---------- the required pipeline ---------- */
std::optional<int> triple_div(int x, int y, int z) {
    return maybe_bind(safe_div(x, y), [=](int a) {
           return safe_div(a, z);
    });
}

/* ---------- extra-credit:  ((x/y)/z)/2  ---------- */
std::optional<int> quad_div(int x, int y, int z) {
    return maybe_bind(safe_div(x, y), [=](int a) {
           return maybe_bind(safe_div(a, z), [=](int b) {
                  return safe_div(b, 2);
           });
    });
}

int main() {
    assert(triple_div(36, 3, 2) == 6);
    assert(triple_div(36, 0, 2) == std::nullopt);
    assert(quad_div(36, 3, 2) == 3);
    assert(quad_div(7, 2, 1) == 1);        // integer division: 7/2=3 → 3/1=3 → 3/2=1
    std::cout << "All checks passed.\n";
}