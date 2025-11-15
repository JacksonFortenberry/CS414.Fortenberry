#include "../include/SortStrategy.h"
#include <vector>

class BubbleSort : public SortStrategy {
public:
    void sort(std::vector<int>& data) override {
        bool swapped;
        for (size_t i = 0; i + 1 < data.size(); ++i) {
            swapped = false;
            for (size_t j = 0; j + 1 < data.size() - i; ++j) {
                if (data[j] > data[j+1]) {
                    std::swap(data[j], data[j+1]);
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
    }
};

extern "C" SortStrategy* create_bubble() { return new BubbleSort(); }
