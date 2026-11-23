/**
 * File: selection_sort.c
 * Created Time: 2023-05-31
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 선택 정렬 */
void selectionSort(int nums[], int n) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for (int i = 0; i < n - 1; i++) {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 최솟값의 인덱스를 기록한다
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
    }
}

/* 실행 코드 */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    selectionSort(nums, n);

    printf("선택 정렬을 마친 후 nums = ");
    printArray(nums, n);

    return 0;
}
