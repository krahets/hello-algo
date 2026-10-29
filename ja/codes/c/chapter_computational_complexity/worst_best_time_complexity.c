/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* 要素が { 1, 2, ..., n } で、順序をシャッフルした配列を生成する */
int *randomNumbers(int n) {
    // ヒープ領域を確保する（要素数 n 、要素型 int の一次元可変長配列を作成する）
    int *nums = (int *)malloc(n * sizeof(int));
    // 配列 nums = { 1, 2, 3, ..., n } を生成する
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // 配列の要素をランダムに並べ替える
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* 配列 nums 内で数値 1 のインデックスを探索する */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* 実行用コード */
int main(int argc, char *argv[]) {
    // 乱数のシードを初期化する
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\n配列 [ 1, 2, ..., n ] をシャッフルした結果 = ");
        printArray(nums, n);
        printf("数値 1 のインデックスは %d\n", index);
        // ヒープ領域を解放する
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
