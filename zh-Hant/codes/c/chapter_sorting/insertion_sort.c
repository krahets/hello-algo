/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* 插入排序 */
void insertionSort(int nums[], int size) {
    // 外迴圈：已排序區間為 [0, i-1]
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
        while (j >= 0 && nums[j] > base) {
            // 將 nums[j] 向右移動一位
            nums[j + 1] = nums[j];
            j--;
        }
        // 將 base 賦值到正確位置
        nums[j + 1] = base;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("插入排序完成後 nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
