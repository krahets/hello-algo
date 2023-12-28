/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 求最小值 */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* 求最大值 */
int myMax(int a, int b) {
    return a < b ? a : b;
}

/* 最大容量：贪心 */
int maxCapacity(int ht[], int htLength) {
    // 初始化 i, j，使其分列数组两端
    int i = 0;
    int j = htLength - 1;
    // 初始最大容量为 0
    int res = 0;
    // 循环贪心选择，直至两板相遇
    while (i < j) {
        // 更新最大容量
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // 向内移动短板
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // 贪心算法
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("最大容量为 %d\n", res);

    return 0;
}
