#include "../include/SortStrategy.h"
#include <vector>

class QuickSort : public SortStrategy {
public:
    void sort(std::vector<int>& data) override {
        quicksort(data, 0, int(data.size()) - 1);
    }
private:
    void quicksort(std::vector<int>& a, int lo, int hi) {
        if (lo >= hi) return;
        int p = partition(a, lo, hi);
        quicksort(a, lo, p - 1);
        quicksort(a, p + 1, hi);
    }
    int partition(std::vector<int>& a, int lo, int hi) {
        int pivot = a[hi];
        int i = lo;
        for (int j = lo; j < hi; ++j) {
            if (a[j] < pivot) {
                std::swap(a[i++], a[j]);
            }
        }
        std::swap(a[i], a[hi]);
        return i;
    }
};

extern "C" SortStrategy* create_quick() { return new QuickSort(); }
