/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 再帰 */
int recur(int n) {
    // 終了条件
    if (n == 1)
        return 1;
    // 往路：再帰呼び出し
    int res = recur(n - 1);
    // 復路：結果を返す
    return n + res;
}

/* 反復を使って再帰を再現する */
int forLoopRecur(int n) {
    int stack[1000]; // 大きな配列を使ってスタックを再現する
    int top = -1;    // スタックの先頭のインデックス
    int res = 0;
    // 往路：再帰呼び出し
    for (int i = n; i > 0; i--) {
        // 「プッシュ操作」で再帰の「往路」を再現する
        stack[1 + top++] = i;
    }
    // 復路：結果を返す
    while (top >= 0) {
        // 「ポップ操作」で再帰の「復路」を再現する
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* 末尾再帰 */
int tailRecur(int n, int res) {
    // 終了条件
    if (n == 0)
        return res;
    // 末尾再帰呼び出し
    return tailRecur(n - 1, res + n);
}

/* フィボナッチ数列：再帰 */
int fib(int n) {
    // 終了条件 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

/* 実行用コード */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\n再帰関数で求めた和 res = %d\n", res);

    res = forLoopRecur(n);
    printf("\n反復で再帰を再現して求めた和 res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\n末尾再帰関数で求めた和 res = %d\n", res);

    res = fib(n);
    printf("\nフィボナッチ数列の第 %d 項は %d\n", n, res);

    return 0;
}
