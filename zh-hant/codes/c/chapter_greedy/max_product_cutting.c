/**
 * File: max_product_cutting.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 最大切分乘積：貪婪法 */
int maxProductCutting(int n) {
    // 當 n <= 3 時，必須切出一個 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 依貪婪策略盡量切出 3，a 為 3 的個數，b 為餘數
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // 若餘數為 1，將一組 1 * 3 改為 2 * 2
        return pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // 若餘數為 2，無須調整
        return pow(3, a) * 2;
    }
    // 若餘數為 0，無須調整
    return pow(3, a);
}

/* 主程式 */
int main(void) {
    int n = 58;
    // 貪婪演算法
    int res = maxProductCutting(n);
    printf("最大切分乘積為 %d\n", res);

    return 0;
}
