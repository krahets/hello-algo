/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* `qsort` 用の比較関数 */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* バケットソート */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // k = n/2 個のバケットを初期化する
    int *sizes = malloc(k * sizeof(int));          // 各バケットのサイズを記録する
    float **buckets = malloc(k * sizeof(float *)); // 動的配列の配列（バケット）
    // 各バケットに十分な容量を事前確保する
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. 配列要素を各バケットに振り分ける
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. 各バケットをソートする
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. ソート済みのバケットを結合する
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // メモリを解放する
        free(buckets[i]);
    }
}

/* Driver Code */
int main() {
    // 入力データは範囲 [0, 1) の浮動小数点数とする
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("バケットソート完了後 nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
