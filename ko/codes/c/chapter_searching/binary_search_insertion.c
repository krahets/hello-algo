/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 삽입 위치의 이진 탐색(중복 원소 없음) */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 닫힌 구간 [0, n-1]을 초기화한다
    while (i <= j) {
        int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
            i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if (nums[m] > target) {
            j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
            return m; // target을 찾았으므로 삽입 위치 m을 반환한다
        }
    }
    // target을 찾지 못했으므로 삽입 위치 i를 반환한다
    return i;
}

/* 삽입 위치의 이진 탐색(중복 원소 있음) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 닫힌 구간 [0, n-1]을 초기화한다
    while (i <= j) {
        int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
            i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if (nums[m] > target) {
            j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
            j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        }
    }
    // 삽입 위치 i를 반환한다
    return i;
}

/* 실행 코드 */
int main() {
    // 중복 원소가 없는 배열
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\n배열 nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // 삽입 위치의 이진 탐색
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("원소 %d의 삽입 위치 인덱스는 %d이다\n", targets1[i], index);
    }

    // 중복 원소를 포함하는 배열
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n배열 nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // 삽입 위치의 이진 탐색
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("원소 %d의 삽입 위치 인덱스는 %d이다\n", targets2[i], index);
    }

    return 0;
}
