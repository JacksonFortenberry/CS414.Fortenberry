#include "../include/SortStrategy.h"
#include "../include/SortContext.h"
#include "../include/Utils.h"

#include <iostream>
#include <sstream>
#include <chrono>
#include <vector>
#include <memory>
#include <algorithm>

#include "../src/QuickSort.cpp"
#include "../src/MergeSort.cpp"
#include "../src/BubbleSort.cpp"

int main(int argc, char** argv) {
    std::string strategy = "quick";
    std::vector<int> data = {5,2,9,1,5,6};

    if (argc > 1) {
        for (int i = 1; i < argc; ++i) {
            std::string s = argv[i];
            if (s == "--strategy" && i+1 < argc) { strategy = argv[++i]; }
            else {
                std::istringstream iss(s);
                int v;
                if (iss >> v) data.push_back(v);
            }
        }
    }

    SortContext ctx;

    std::unique_ptr<SortStrategy> quick(create_quick());
    std::unique_ptr<SortStrategy> merge(create_merge());
    std::unique_ptr<SortStrategy> bubble(create_bubble());

    if (strategy == "quick") ctx.set_strategy(quick.get());
    else if (strategy == "merge") ctx.set_strategy(merge.get());
    else if (strategy == "bubble") ctx.set_strategy(bubble.get());
    else if (strategy == "lambda") {
        ctx.set_lambda_strategy([](std::vector<int>& v){ std::sort(v.begin(), v.end()); });
    }

    auto copy = data;
    auto start = Clock::now();
    ctx.execute_strategy(copy);
    auto end = Clock::now();

    std::cout << "Input: ";
    for (auto n : data) std::cout << n << ' ';
    std::cout << '\n';

    std::cout << "Sorted: ";
    for (auto n : copy) std::cout << n << ' ';
    std::cout << '\n';

    auto dur = time_ms(start, end);
    std::cout << "Time: " << dur.count() << " ms\n";

    return 0;
}
