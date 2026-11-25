/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 定数オーダー */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* 線形オーダー */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 線形オーダー（配列の走査） */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // 反復回数は配列の長さに比例
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 二次オーダー */
int quadratic(int n) {
    int count = 0;
    // 反復回数はデータサイズ n の二乗に比例
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* 二次オーダー（バブルソート） */
int bubbleSort(int *nums, int n) {
    int count = 0; // カウンタ
    // 外側のループ：未整列区間は [0, i]
    for (int i = n - 1; i > 0; i--) {
        // 内側のループ：未整列区間 [0, i] の最大要素を、交換しながら区間の右端へ移す
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素の交換は 3 回の基本操作からなる
            }
        }
    }
    return count;
}

/* 指数オーダー（ループによる実装） */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // 各回で細胞が二分し、分裂する細胞の数は 1, 2, 4, 8, ..., 2^(n-1) となる
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* 指数オーダー（再帰による実装） */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 対数オーダー（ループによる実装） */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* 対数オーダー（再帰による実装） */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* 線形対数オーダー */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* 階乗オーダー（再帰による実装） */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* 実行例 */
int main(int argc, char *argv[]) {
    // n を変えて実行し、計算量ごとに操作回数の増え方を確かめる
    int n = 8;
    printf("入力データのサイズ n = %d\n", n);

    int count = constant(n);
    printf("定数オーダーの操作回数 = %d\n", count);

    count = linear(n);
    printf("線形オーダーの操作回数 = %d\n", count);
    // ヒープにメモリを確保（int 型の要素 n 個からなる可変長の一次元配列を作成）
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("線形オーダー（配列の走査）の操作回数 = %d\n", count);

    count = quadratic(n);
    printf("二次オーダーの操作回数 = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("二次オーダー（バブルソート）の操作回数 = %d\n", count);

    count = exponential(n);
    printf("指数オーダー（ループによる実装）の操作回数 = %d\n", count);
    count = expRecur(n);
    printf("指数オーダー（再帰による実装）の操作回数 = %d\n", count);

    count = logarithmic(n);
    printf("対数オーダー（ループによる実装）の操作回数 = %d\n", count);
    count = logRecur(n);
    printf("対数オーダー（再帰による実装）の操作回数 = %d\n", count);

    count = linearLogRecur(n);
    printf("線形対数オーダー（再帰による実装）の操作回数 = %d\n", count);

    count = factorialRecur(n);
    printf("階乗オーダー（再帰による実装）の操作回数 = %d\n", count);

    // ヒープのメモリを解放
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
