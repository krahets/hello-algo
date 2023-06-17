/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define ARRAY_SIZE 10

/* 比较两个浮点数的大小 */
int compare_float(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* 交换两个浮点数 */
void swap(float *a, float *b) {
    float tmp = *a;
    *a = *b;
    *b = tmp;
}

/* 桶排序 */
void bucketSort(float nums[], int size) {
    // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
    int k = size / 2;
    float **buckets = calloc(k, sizeof(float *));
    for (int i = 0; i < k; i++) {
        // 每个桶最多可以分配 k 个元素
        buckets[i] = calloc(ARRAY_SIZE, sizeof(float));
    }

    // 1. 将数组元素分配到各个桶中
    for (int i = 0; i < size; i++) {
        // 输入数据范围 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
        int bucket_idx = nums[i] * k;
        int j = 0;
        // 如果桶中有数据且数据小于当前值 nums[i], 要将其放到当前桶的后面，相当于 cpp 中的 push_back
        while (buckets[bucket_idx][j] > 0 && buckets[bucket_idx][j] < nums[i]) {
            j++;
        }
        float temp = nums[i];
        while (j < ARRAY_SIZE && buckets[bucket_idx][j] > 0) {
            swap(&temp, &buckets[bucket_idx][j]);
            j++;
        }
        buckets[bucket_idx][j] = temp;
    }

    // 2. 对各个桶执行排序
    for (int i = 0; i < k; i++) {
        qsort(buckets[i], ARRAY_SIZE, sizeof(float), compare_float);
    }

    // 3. 遍历桶合并结果
    for (int i = 0, j = 0; j < k; j++) {
        for (int l = 0; l < ARRAY_SIZE; l++) {
            if (buckets[j][l] > 0) {
                nums[i++] = buckets[j][l];
            }
        }
    }

    // 释放上述分配的内存
    for (int i = 0; i < k; i++) {
        free(buckets[i]);
    }
    free(buckets);
}

/* Driver Code */
int main() {
    // 设输入数据为浮点数，范围为 [0, 1)
    float nums[ARRAY_SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, ARRAY_SIZE);
    printf("桶排序完成后 nums = ");
    printArrayFloat(nums, ARRAY_SIZE);

    return 0;
}