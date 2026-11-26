/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* { 1, 2, ..., n } の要素をランダムに並べた配列を生成 */
int *randomNumbers(int n) {
    // ヒープにメモリを確保（int 型の要素 n 個からなる可変長の一次元配列を作成）
    int *nums = (int *)malloc(n * sizeof(int));
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 配列の要素をシャッフル
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* 配列 nums で数値 1 のインデックスを探す */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 実行例 */
int main(int argc, char *argv[]) {
    // 乱数のシードを初期化
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n配列 [ 1, 2, ..., n ] のシャッフル結果 = ");
        printArray(nums, n);
        printf("数値 1 のインデックスは %d\n", index);
        // ヒープのメモリを解放
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
