/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* 比較兩個浮點數的大小 */
int compare_float(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* 交換兩個浮點數 */
void swap(float *a, float *b) {
    float tmp = *a;
    *a = *b;
    *b = tmp;
}

/* 桶排序 */
void bucketSort(float nums[], int size) {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    int k = size / 2;
    float **buckets = calloc(k, sizeof(float *));
    for (int i = 0; i < k; i++) {
        // 每個桶最多可以分配 size 個元素
        buckets[i] = calloc(size, sizeof(float));
    }

    // 1. 將陣列元素分配到各個桶中
    for (int i = 0; i < size; i++) {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        int bucket_idx = nums[i] * k;
        int j = 0;
        // 如果桶中有資料且資料小於當前值 nums[i], 要將其放到當前桶的後面，相當於 cpp 中的 push_back
        while (buckets[bucket_idx][j] > 0 && buckets[bucket_idx][j] < nums[i]) {
            j++;
        }
        float temp = nums[i];
        while (j < size && buckets[bucket_idx][j] > 0) {
            swap(&temp, &buckets[bucket_idx][j]);
            j++;
        }
        buckets[bucket_idx][j] = temp;
    }

    // 2. 對各個桶執行排序
    for (int i = 0; i < k; i++) {
        qsort(buckets[i], size, sizeof(float), compare_float);
    }

    // 3. 走訪桶合併結果
    for (int i = 0, j = 0; j < k; j++) {
        for (int l = 0; l < size; l++) {
            if (buckets[j][l] > 0) {
                nums[i++] = buckets[j][l];
            }
        }
    }

    // 釋放上述分配的記憶體
    for (int i = 0; i < k; i++) {
        free(buckets[i]);
    }
    free(buckets);
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