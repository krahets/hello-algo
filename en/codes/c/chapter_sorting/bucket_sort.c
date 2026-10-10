/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* Comparison function for qsort */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* Bucket sort */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // Initialize k = n/2 buckets
    int *sizes = malloc(k * sizeof(int));          // Record each bucket's size
    float **buckets = malloc(k * sizeof(float *)); // Array of dynamic arrays (buckets)
    // Pre-allocate sufficient space for each bucket
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. Distribute array elements into various buckets
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. Sort each bucket
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. Merge sorted buckets
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // Free memory
        free(buckets[i]);
    }
}

/* Driver Code */
int main() {
    // Assume input data is floating point, interval [0, 1)
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("After bucket sort completes, nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
