/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 最大容量：貪婪 */
int maxCapacity(vector<int> &ht) {
    // 初始化 i, j，使其分列陣列兩端
    int i = 0, j = ht.size() - 1;
    // 初始最大容量為 0
    int res = 0;
    // 迴圈貪婪選擇，直至兩板相遇
    while (i < j) {
        // 更新最大容量
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 向內移動短板
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // 貪婪演算法
    int res = maxCapacity(ht);
    cout << "最大容量為 " << res << endl;

    return 0;
}
