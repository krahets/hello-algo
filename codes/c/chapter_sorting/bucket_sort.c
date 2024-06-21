/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* 用于 qsort 的比较函数 */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* 桶排序 */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // 初始化 k = n/2 个桶
    int *sizes = malloc(k * sizeof(int));          // 记录每个桶的大小
    float **buckets = malloc(k * sizeof(float *)); // 动态数组的数组（桶）
    // 为每个桶预分配足够的空间
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. 将数组元素分配到各个桶中
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. 对各个桶执行排序
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. 合并排序后的桶
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // 释放内存
        free(buckets[i]);
    }
}

/* Driver Code */
int main() {
    // 设输入数据为浮点数，范围为 [0, 1)
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("桶排序完成后 nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
