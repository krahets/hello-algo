/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* 삽입 정렬 */
void insertionSort(int nums[], int size) {
    // 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
        while (j >= 0 && nums[j] > base) {
            // nums[j]를 오른쪽으로 한 칸 이동한다
            nums[j + 1] = nums[j];
            j--;
        }
        // 올바른 위치에 base를 대입한다
        nums[j + 1] = base;
    }
}

/* 실행 코드 */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("삽입 정렬을 마친 후 nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
