/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // 余りが 2 の場合、何もしない
        return (int)pow(3, a) * 2;
    }
    // 余りが 0 の場合、何もしない
    return (int)pow(3, a);
}

/* 実行用コード */
int main() {
    int n = 58;

    // 貪欲アルゴリズム
    int res = maxProductCutting(n);
    cout << "分割後の積の最大値は" << res << endl;

    return 0;
}
