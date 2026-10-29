/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 二分探索による挿入位置の探索（重複要素がない場合） */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            return m; // target が見つかったので、挿入位置 m を返す
        }
    }
    // target が見つからなかったので、挿入位置 i を返す
    return i;
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // 閉区間 [0, n-1] を初期化する
    while (i <= j) {
        int m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if (nums[m] < target) {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if (nums[m] > target) {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    return i;
}

/* 実行用コード */
int main() {
    // 重複要素のない配列
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\n配列 nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // 二分探索による挿入位置の探索
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("要素 %d の挿入位置のインデックスは %d\n", targets1[i], index);
    }

    // 重複要素を含む配列
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\n配列 nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // 二分探索による挿入位置の探索
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("要素 %d の挿入位置のインデックスは %d\n", targets2[i], index);
    }

    return 0;
}
