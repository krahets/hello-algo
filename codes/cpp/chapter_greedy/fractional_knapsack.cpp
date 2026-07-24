/**
 * File: fractional_knapsack.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、代码规范
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 物品 */
struct Item {
    int w; // 物品重量
    int v; // 物品价值

    Item(int w, int v) : w(w), v(v) {}
};

/* 分数背包：贪心 */
double fractionalKnapsack(const std::vector<int>& wgt,
                          const std::vector<int>& val,
                          int cap) {
    // 创建物品列表
    std::vector<Item> items;
    items.reserve(wgt.size());

    for (size_t i = 0; i < wgt.size(); ++i) {
        items.emplace_back(wgt[i], val[i]);
    }

    // 按单位价值降序排序（使用 const 引用，不修改）
    std::sort(items.begin(), items.end(), [](const Item& a, const Item& b) {
        return static_cast<double>(a.v) / a.w > static_cast<double>(b.v) / b.w;
    });

    // 贪心选择
    double res = 0.0;
    int remaining = cap;

    for (const auto& item : items) {
        if (remaining <= 0) break;

        if (item.w <= remaining) {
            // 整个放入
            res += item.v;
            remaining -= item.w;
        } else {
            // 放入部分
            res += static_cast<double>(item.v) / item.w * remaining;
            remaining = 0;
        }
    }

    return res;
}

/* Driver Code */
int main() {
    const std::vector<int> wgt = {10, 20, 30, 40, 50};
    const std::vector<int> val = {50, 120, 150, 210, 240};
    const int cap = 50;

    double res = fractionalKnapsack(wgt, val, cap);
    std::cout << "不超过背包容量的最大物品价值为 " << res << '\n';

    return 0;
}
