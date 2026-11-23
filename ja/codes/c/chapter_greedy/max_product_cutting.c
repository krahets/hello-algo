/**
 * File: max_product_cutting.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 分割後の積の最大化：貪欲法 */
int maxProductCutting(int n) {
    // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
        return pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // 余りが 2 の場合、何もしない
        return pow(3, a) * 2;
    }
    // 余りが 0 の場合、何もしない
    return pow(3, a);
}

/* 実行用コード */
int main(void) {
    int n = 58;
    // 貪欲アルゴリズム
    int res = maxProductCutting(n);
    printf("分割後の積の最大値は %d\n", res);

    return 0;
}
