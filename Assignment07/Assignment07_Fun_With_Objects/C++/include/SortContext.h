#pragma once
#include "SortStrategy.h"
#include <functional>
#include <memory>
#include <vector>

class SortContext {
public:
    using Lambda = std::function<void(std::vector<int>&)>;

    SortContext();

    void set_strategy(SortStrategy* s);
    void set_lambda_strategy(Lambda lambda);

    void execute_strategy(std::vector<int>& data) const;

private:
    SortStrategy* strategy_;
    Lambda lambda_;
};
