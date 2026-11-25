/**
 * File: merge_sort.c
 * Created Time: 2022-03-21
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 合併左、右子陣列 */
void merge(int *nums, int left, int mid, int right) {
    // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
    // 建立暫存陣列 tmp，用來存放合併結果
    int tmpSize = right - left + 1;
    int *tmp = (int *)malloc(tmpSize * sizeof(int));
    // 設定左、右子陣列的起始索引
    int i = left, j = mid + 1, k = 0;
    // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 將左、右子陣列中剩餘的元素複製到暫存陣列
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
    for (k = 0; k < tmpSize; ++k) {
        nums[left + k] = tmp[k];
    }
    // 釋放記憶體
    free(tmp);
}

/* 合併排序 */
void mergeSort(int *nums, int left, int right) {
    // 終止條件
    if (left >= right)
        return; // 當子陣列的長度為 1 時，終止遞迴
    // 分割階段
    int mid = left + (right - left) / 2;    // 計算中點
    mergeSort(nums, left, mid);      // 遞迴處理左子陣列
    mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
    // 合併階段
    merge(nums, left, mid, right);
}

/* 主程式 */
int main() {
    /* 合併排序 */
    int nums[] = {7, 3, 2, 6, 0, 1, 5, 4};
    int size = sizeof(nums) / sizeof(int);
    mergeSort(nums, 0, size - 1);
    printf("合併排序完成後 nums = ");
    printArray(nums, size);

    return 0;
}
