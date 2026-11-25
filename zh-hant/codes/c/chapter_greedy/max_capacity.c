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
    return a > b ? a : b;
}

/* 最大容量：貪婪法 */
int maxCapacity(int ht[], int htLength) {
    // 將 i、j 分別設在陣列的兩端
    int i = 0;
    int j = htLength - 1;
    // 起始最大容量為 0
    int res = 0;
    // 反覆執行貪婪選擇，直到兩塊隔板相遇
    while (i < j) {
        // 更新最大容量
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // 將較矮隔板的指標往內移
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* 主程式 */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // 貪婪演算法
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("最大容量為 %d\n", res);

    return 0;
}
