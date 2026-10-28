/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* qsort용 비교 함수 */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* 버킷 정렬 */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // k = n/2개의 버킷을 초기화한다
    int *sizes = malloc(k * sizeof(int));          // 각 버킷의 크기를 기록한다
    float **buckets = malloc(k * sizeof(float *)); // 동적 배열의 배열(버킷)
    // 각 버킷에 충분한 공간을 미리 할당한다
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. 배열 원소를 각 버킷에 배정한다
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. 각 버킷을 정렬한다
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. 정렬한 버킷을 병합한다
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // 메모리 해제
        free(buckets[i]);
    }
}

/* 실행 코드 */
int main() {
    // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("버킷 정렬을 마친 후 nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
