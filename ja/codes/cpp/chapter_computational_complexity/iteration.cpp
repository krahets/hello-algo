/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for ループ */
int forLoop(int n) {
    int res = 0;
    // 1, 2, ..., n-1, n の合計をループ計算
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while ループ */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 条件変数を初期化
    // 1, 2, ..., n-1, n の合計をループ計算
    while (i <= n) {
        res += i;
        i++; // 条件変数を更新
    }
    return res;
}

/* while ループ（2つの更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 条件変数を初期化
    // 1, 4, 10, ... の合計をループ計算
    while (i <= n) {
        res += i;
        // 条件変数を更新
        i++;
        i *= 2;
    }
    return res;
}

/* 2重 for ループ */
string nestedForLoop(int n) {
    ostringstream res;
    // ループ i = 1, 2, ..., n-1, n
    for (int i = 1; i <= n; ++i) {
        // ループ j = 1, 2, ..., n-1, n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* ドライバーコード */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nfor ループの合計結果 res = " << res << endl;

    res = whileLoop(n);
    cout << "\nwhile ループの合計結果 res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nwhile ループ（2つの更新）の合計結果 res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\n2重 for ループ走査の結果 = " << resStr << endl;

    return 0;
}