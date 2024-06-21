/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* 用於 qsort 的比較函式 */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* 桶排序 */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // 初始化 k = n/2 個桶
    int *sizes = malloc(k * sizeof(int));          // 記錄每個桶的大小
    float **buckets = malloc(k * sizeof(float *)); // 動態陣列的陣列（桶）
    // 為每個桶預分配足夠的空間
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. 將陣列元素分配到各個桶中
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. 對各個桶執行排序
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. 合併排序後的桶
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // 釋放記憶體
        free(buckets[i]);
    }
}

/* Driver Code */
int main() {
    // 設輸入資料為浮點數，範圍為 [0, 1)
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("桶排序完成後 nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
