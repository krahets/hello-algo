/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* カウントソート */
// 簡易実装。オブジェクトのソートには使えない
void countingSortNaive(int nums[], int size) {
    // 1. 配列の最大要素 m を求める
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. counter を走査し、各要素を元の配列 nums に入れる
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
    // 4. メモリを解放する
    free(counter);
}

/* カウントソート */
// 完全な実装。オブジェクトをソートでき、安定ソートである
void countingSort(int nums[], int size) {
    // 1. 配列の最大要素 m を求める
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    int *counter = calloc(m, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. counter の累積和を求め、「出現回数」を「末尾のインデックス」に変換する
    // つまり、counter[num]-1 は res 内で num が最後に現れるインデックスである
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に入れる
    // 結果を記録する配列 res を初期化する
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // 対応するインデックスに num を配置する
        counter[num]--;              // 累積和を 1 減らし、次に num を配置するインデックスを求める
    }
    // 結果配列 res で元の配列 nums を上書きする
    memcpy(nums, res, size * sizeof(int));
    // 5. メモリを解放する
    free(res);
    free(counter);
}

/* 実行用コード */
int main() {
    int nums[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size = sizeof(nums) / sizeof(int);
    countingSortNaive(nums, size);
    printf("カウントソート（オブジェクトはソート不可）の完了後 nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("カウントソート完了後 nums1 = ");
    printArray(nums1, size1);

    return 0;
}
