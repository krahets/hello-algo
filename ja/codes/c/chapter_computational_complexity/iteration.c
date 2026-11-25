/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for ループ */
int forLoop(int n) {
    int res = 0;
    // 1, 2, ..., n-1, n の和をループで求める
    for (int i = 1; i <= n; i++) {
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
char *nestedForLoop(int n) {
    // 点の個数は n * n。各点を表す文字列 "(i, j), " の長さは最大 6+10*2 で、末尾のヌル文字 \0 の領域も必要
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* 実行例 */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nfor ループによる総和 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile ループによる総和 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile ループ（2 回更新）による総和 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n二重の for ループの走査結果 %s\r\n", resStr);
    free(resStr);

    return 0;
}
