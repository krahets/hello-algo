/**
 * File: selection_sort.c
 * Created Time: 2023-05-31
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 選択ソート */
void selectionSort(int nums[], int n) {
    // 外側ループ：未整列区間は [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 内側のループ：未ソート区間の最小要素を見つける
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 最小要素のインデックスを記録
        }
        // その最小要素を未整列区間の先頭要素と交換する
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    selectionSort(nums, n);

    printf("選択ソート完了後 nums = ");
    printArray(nums, n);

    return 0;
}
