/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* 挿入ソート */
void insertionSort(int nums[], int size) {
    // 外側ループ：整列済み区間は [0, i-1]
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // 内側ループ: base をソート済み区間 [0, i-1] の正しい位置に挿入する
        while (j >= 0 && nums[j] > base) {
            // nums[j] を 1 つ右へ移動する
            nums[j + 1] = nums[j];
            j--;
        }
        // base を正しい位置に配置する
        nums[j + 1] = base;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("挿入ソート完了後 nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
