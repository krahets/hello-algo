/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* バブルソート */
void bubbleSort(int nums[], int size) {
    // 外側のループ：未ソート区間は [0, i]
    for (int i = size - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* バブルソート（フラグ最適化） */
void bubbleSortWithFlag(int nums[], int size) {
    // 外側のループ：未ソート区間は [0, i]
    for (int i = size - 1; i > 0; i--) {
        bool flag = false;
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
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

/* Driver Code */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("バブルソート後: ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }

    int nums1[6] = {4, 1, 3, 1, 5, 2};
    printf("\n最適化版バブルソート後: ");
    bubbleSortWithFlag(nums1, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums1[i]);
    }
    printf("\n");

    return 0;
}
