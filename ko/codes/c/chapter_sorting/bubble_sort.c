/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* 버블 정렬 */
void bubbleSort(int nums[], int size) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (int i = size - 1; i > 0; i--) {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬*/
void bubbleSortWithFlag(int nums[], int size) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (int i = size - 1; i > 0; i--) {
        bool flag = false;
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
                flag = true;
            }
        }
        if (!flag)
            break;
    }
}

/* 실행 예제 */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("버블 정렬 후: ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }

    int nums1[6] = {4, 1, 3, 1, 5, 2};
    printf("\n최적화한 버블 정렬 후: ");
    bubbleSortWithFlag(nums1, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums1[i]);
    }
    printf("\n");

    return 0;
}
