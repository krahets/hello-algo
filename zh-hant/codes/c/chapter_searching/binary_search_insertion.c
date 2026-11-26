/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 用二分搜尋找插入點（無重複元素） */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            return m; // 找到 target，回傳插入點 m
        }
    }
    // 找不到 target，回傳插入點 i
    return i;
}

/* 用二分搜尋找插入點（有重複元素） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 將閉區間設為 [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if (nums[m] > target) {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
        }
    }
    // 回傳插入點 i
    return i;
}

/* 主程式 */
int main() {
    // 不含重複元素的陣列
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\n陣列 nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // 用二分搜尋找插入點
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("元素 %d 的插入位置索引為 %d\n", targets1[i], index);
    }

    // 含有重複元素的陣列
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n陣列 nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // 用二分搜尋找插入點
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("元素 %d 的插入位置索引為 %d\n", targets2[i], index);
    }

    return 0;
}
