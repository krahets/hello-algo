/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for ループ */
int forLoop(int n) {
    int res = 0;
    // 1, 2, ..., n-1, n の和をループで求める
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while ループ */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 条件判定用の変数を初期化
    // 1, 2, ..., n-1, n の和をループで求める
    while (i <= n) {
        res += i;
        i++; // 条件判定用の変数を更新
    }
    return res;
}

/* while ループ（2 回更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 条件判定用の変数を初期化
    // 1, 4, 10, ... の和をループで求める
    while (i <= n) {
        res += i;
        // 条件判定用の変数を更新
        i++;
        i *= 2;
    }
    return res;
}

/* 二重の for ループ */
string nestedForLoop(int n) {
    ostringstream res;
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for (int i = 1; i <= n; ++i) {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* 実行例 */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nfor ループによる総和 res = " << res << endl;

    res = whileLoop(n);
    cout << "\nwhile ループによる総和 res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nwhile ループ（2 回更新）による総和 res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\n二重の for ループの走査結果 " << resStr << endl;

    return 0;
}
