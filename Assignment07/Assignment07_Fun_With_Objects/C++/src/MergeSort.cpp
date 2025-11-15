#include "../include/SortStrategy.h"
#include <vector>

class MergeSort : public SortStrategy {
public:
    void sort(std::vector<int>& data) override {
        if (data.size() <= 1) return;
        std::vector<int> buffer(data.size());
        mergesort(data, buffer, 0, int(data.size()) - 1);
    }
private:
    void mergesort(std::vector<int>& a, std::vector<int>& buf, int lo, int hi) {
        if (lo >= hi) return;
        int mid = lo + (hi - lo) / 2;
        mergesort(a, buf, lo, mid);
        mergesort(a, buf, mid+1, hi);
        merge(a, buf, lo, mid, hi);
    }
    void merge(std::vector<int>& a, std::vector<int>& buf, int lo, int mid, int hi) {
        int i = lo, j = mid+1, k = lo;
        while (i <= mid && j <= hi) {
            if (a[i] <= a[j]) buf[k++] = a[i++];
            else buf[k++] = a[j++];
        }
        while (i <= mid) buf[k++] = a[i++];
        while (j <= hi) buf[k++] = a[j++];
        for (int t = lo; t <= hi; ++t) a[t] = buf[t];
    }
};

extern "C" SortStrategy* create_merge() { return new MergeSort(); }
