/**
 * File: merge_sort.c
 * Created Time: 2022-03-21
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
void merge(int *nums, int left, int mid, int right) {
    // 왼쪽 부분 배열의 구간은 [left, mid], 오른쪽 부분 배열의 구간은 [mid+1, right]
    // 병합 결과를 담을 임시 배열 tmp 생성
    int tmpSize = right - left + 1;
    int *tmp = (int *)malloc(tmpSize * sizeof(int));
    // 왼쪽과 오른쪽 부분 배열의 시작 인덱스 초기화
    int i = left, j = mid + 1, k = 0;
    // 양쪽 부분 배열에 모두 원소가 남아 있으면 서로 비교하여 더 작은 원소를 임시 배열에 복사
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 양쪽 부분 배열에서 남은 원소를 임시 배열에 복사
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사
    for (k = 0; k < tmpSize; ++k) {
        nums[left + k] = tmp[k];
    }
    // 메모리 해제
    free(tmp);
}

/* 병합 정렬 */
void mergeSort(int *nums, int left, int right) {
    // 종료 조건
    if (left >= right)
        return; // 부분 배열의 길이가 1이면 재귀 종료
    // 분할 단계
    int mid = left + (right - left) / 2;    // 중간 지점 계산
    mergeSort(nums, left, mid);      // 왼쪽 부분 배열을 재귀적으로 정렬
    mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열을 재귀적으로 정렬
    // 병합 단계
    merge(nums, left, mid, right);
}

/* 실행 예제 */
int main() {
    /* 병합 정렬 */
    int nums[] = {7, 3, 2, 6, 0, 1, 5, 4};
    int size = sizeof(nums) / sizeof(int);
    mergeSort(nums, 0, size - 1);
    printf("병합 정렬 후 nums = ");
    printArray(nums, size);

    return 0;
}
