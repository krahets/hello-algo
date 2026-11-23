/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for ループ */
int forLoop(int n) {
    int res = 0;
    // ループで 1, 2, ..., n-1, n の和を求める
    for (int i = 1; i <= n; i++) {
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
char *nestedForLoop(int n) {
    // n * n は点の個数であり、文字列 "(i, j), " の長さは最大 6+10*2 である。さらに末尾のヌル文字 \0 のための領域を加える
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // i = 1, 2, ..., n-1, n のループ
    for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n のループ
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* 実行用コード */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nfor ループで求めた和 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile ループで求めた和 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile ループ（2 回の更新）で求めた和 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n二重 for ループの走査結果 %s\r\n", resStr);
    free(resStr);

    return 0;
}
