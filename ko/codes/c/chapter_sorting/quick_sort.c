/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 원소 교환 */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* 양방향 포인터로 분할 */
int partition(int nums[], int left, int right) {
    // nums[left]를 피벗으로 선택
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        }
        // 두 원소 교환
        swap(nums, i, j);
    }
    // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
    swap(nums, i, left);
    // 피벗의 인덱스 반환
    return i;
}

/* 퀵 정렬 */
void quickSort(int nums[], int left, int right) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if (left >= right) {
        return;
    }
    // 양방향 포인터로 분할
    int pivot = partition(nums, left, right);
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// 이하에서는 중앙값으로 퀵 정렬을 최적화

/* 세 후보 원소의 중앙값 선택 */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m이 l과 r 사이에 있음
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l이 m과 r 사이에 있음
    return right;
}

/* 양방향 포인터로 분할(세 값의 중앙값 선택) */
int partitionMedian(int nums[], int left, int right) {
    // 세 후보 원소의 중앙값 선택
    int med = medianThree(nums, left, (left + right) / 2, right);
    // 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
    swap(nums, left, med);
    // nums[left]를 피벗으로 선택
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
        while (i < j && nums[i] <= nums[left])
            i++;          // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
        swap(nums, i, j); // 두 원소 교환
    }
    swap(nums, i, left); // 교환을 통해 피벗을 두 부분 배열의 경계에 배치
    return i;            // 피벗의 인덱스 반환
}

/* 퀵 정렬(세 값의 중앙값 선택) */
void quickSortMedian(int nums[], int left, int right) {
    // 부분 배열의 길이가 1이면 재귀 종료
    if (left >= right)
        return;
    // 양방향 포인터로 분할
    int pivot = partitionMedian(nums, left, right);
    // 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// 이하에서는 재귀 깊이를 줄여 퀵 정렬을 최적화

/* 퀵 정렬(재귀 깊이 최적화) */
void quickSortTailCall(int nums[], int left, int right) {
    // 부분 배열의 길이가 1이면 종료
    while (left < right) {
        // 양방향 포인터로 분할
        int pivot = partition(nums, left, right);
        // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
        if (pivot - left < right - pivot) {
            // 왼쪽 부분 배열 재귀 정렬
            quickSortTailCall(nums, left, pivot - 1);
            // 남은 미정렬 구간은 [pivot + 1, right]
            left = pivot + 1;
        } else {
            // 오른쪽 부분 배열 재귀 정렬
            quickSortTailCall(nums, pivot + 1, right);
            // 남은 미정렬 구간은 [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* 실행 예제 */
int main() {
    /* 퀵 정렬 */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("퀵 정렬 후 nums = ");
    printArray(nums, size);

    /* 퀵 정렬(중앙값 피벗 최적화) */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("퀵 정렬(중앙값 피벗 최적화) 후 nums = ");
    printArray(nums1, size);

    /* 퀵 정렬(재귀 깊이 최적화) */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("퀵 정렬(재귀 깊이 최적화) 후 nums = ");
    printArray(nums1, size);

    return 0;
}
