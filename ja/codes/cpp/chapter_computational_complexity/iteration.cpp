/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for ループ */
int forLoop(int n) {
    int res = 0;
    // ループで 1, 2, ..., n-1, n の和を求める
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while ループ */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 条件変数を初期化する
    // ループで 1, 2, ..., n-1, n の和を求める
    while (i <= n) {
        res += i;
        i++; // 条件変数を更新する
    }
    return res;
}

/* while ループ（2 回の更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 条件変数を初期化する
    // ループで 1, 4, 10, ... の和を求める
    while (i <= n) {
        res += i;
        // 条件変数を更新する
        i++;
        i *= 2;
    }
    return res;
}

/* 二重 for ループ */
string nestedForLoop(int n) {
    ostringstream res;
    // i = 1, 2, ..., n-1, n のループ
    for (int i = 1; i <= n; ++i) {
        // j = 1, 2, ..., n-1, n のループ
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* 実行用コード */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nfor ループで求めた和 res = " << res << endl;

    res = whileLoop(n);
    cout << "\nwhile ループで求めた和 res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nwhile ループ（2 回の更新）で求めた和 res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\n二重 for ループの走査結果 " << resStr << endl;

    return 0;
}
