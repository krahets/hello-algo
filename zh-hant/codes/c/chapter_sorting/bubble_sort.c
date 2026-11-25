/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* 氣泡排序 */
void bubbleSort(int nums[], int size) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (int i = size - 1; i > 0; i--) {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* 氣泡排序（以旗標最佳化）*/
void bubbleSortWithFlag(int nums[], int size) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (int i = size - 1; i > 0; i--) {
        bool flag = false;
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
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

/* 主程式 */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("氣泡排序後： ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }

    int nums1[6] = {4, 1, 3, 1, 5, 2};
    printf("\n最佳化版氣泡排序後： ");
    bubbleSortWithFlag(nums1, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums1[i]);
    }
    printf("\n");

    return 0;
}
