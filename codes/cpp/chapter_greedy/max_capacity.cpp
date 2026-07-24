/**
 * File: max_capacity.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、代码规范
 */

#include "../utils/common.hpp"
#include <vector>
#include <algorithm>
#include <iostream>

/* 最大容量：贪心（双指针） */
int maxCapacity(const std::vector<int>& ht) {
    int i = 0;
    int j = static_cast<int>(ht.size()) - 1;
    int res = 0;

    // 循环贪心选择，直至两板相遇
    while (i < j) {
        // 计算当前容量
        int h = std::min(ht[i], ht[j]);
        int w = j - i;
        int cap = h * w;
        res = std::max(res, cap);

        // 向内移动短板
        if (ht[i] < ht[j]) {
            ++i;
        } else {
            --j;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    const std::vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    int res = maxCapacity(ht);
    std::cout << "最大容量为 " << res << '\n';

    return 0;
}
