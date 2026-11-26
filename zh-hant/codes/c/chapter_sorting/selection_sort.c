/**
 * File: selection_sort.c
 * Created Time: 2023-05-31
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 選擇排序 */
void selectionSort(int nums[], int n) {
    // 外層迴圈：未排序區間為 [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 內層迴圈：找出未排序區間中的最小元素
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 記錄最小元素的索引
        }
        // 將最小元素與未排序區間的第一個元素交換
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
    }
}

/* 主程式 */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    selectionSort(nums, n);

    printf("選擇排序完成後 nums = ");
    printArray(nums, n);

    return 0;
}
