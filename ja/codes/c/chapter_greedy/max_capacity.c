/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 最小値を求める */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* 最大値を求める */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 最大容量：貪欲法 */
int maxCapacity(int ht[], int htLength) {
    // i, j を初期化し、配列の両端をそれぞれ指すようにする
    int i = 0;
    int j = htLength - 1;
    // 最大容量の初期値は 0
    int res = 0;
    // 2 枚の板が出会うまで貪欲な選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // 低い方の仕切り板を内側に移動する
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* 実行用コード */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // 貪欲アルゴリズム
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("最大容量は %d\n", res);

    return 0;
}
