/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 要素の交換 */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* 番兵分割 */
int partition(int nums[], int left, int right) {
    // nums[left] を基準値とする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // 右から左へ基準値未満の最初の要素を探す
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // 左から右へ基準値より大きい最初の要素を探す
        }
        // この 2 つの要素を交換
        swap(nums, i, j);
    }
    // 基準値を 2 つの部分配列の境界へ交換する
    swap(nums, i, left);
    // 基準値のインデックスを返す
    return i;
}

/* クイックソート */
void quickSort(int nums[], int left, int right) {
    // 部分配列の長さが 1 なら再帰を終了する
    if (left >= right) {
        return;
    }
    // 番兵分割
    int pivot = partition(nums, left, right);
    // 左右の部分配列を再帰処理
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// 以下は中央値最適化版のクイックソート

/* 3つの候補要素の中央値を選ぶ */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m は l と r の間
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l は m と r の間
    return right;
}

/* 番兵による分割処理（3 点中央値） */
int partitionMedian(int nums[], int left, int right) {
    // 3つの候補要素の中央値を選ぶ
    int med = medianThree(nums, left, (left + right) / 2, right);
    // 中央値を配列の最左端に交換する
    swap(nums, left, med);
    // nums[left] を基準値とする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // 右から左へ基準値未満の最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++;          // 左から右へ基準値より大きい最初の要素を探す
        swap(nums, i, j); // この 2 つの要素を交換
    }
    swap(nums, i, left); // 基準値を 2 つの部分配列の境界へ交換する
    return i;            // 基準値のインデックスを返す
}

/* クイックソート（三点中央値法） */
void quickSortMedian(int nums[], int left, int right) {
    // 部分配列の長さが 1 なら再帰を終了する
    if (left >= right)
        return;
    // 番兵分割
    int pivot = partitionMedian(nums, left, right);
    // 左右の部分配列を再帰処理
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// 以下は再帰の深さを最適化したクイックソート

/* クイックソート（再帰深度最適化） */
void quickSortTailCall(int nums[], int left, int right) {
    // 部分配列の長さが 1 なら終了
    while (left < right) {
        // 番兵による分割処理
        int pivot = partition(nums, left, right);
        // 2 つの部分配列のうち短いほうにクイックソートを適用する
        if (pivot - left < right - pivot) {
            // 左部分配列を再帰的にソート
            quickSortTailCall(nums, left, pivot - 1);
            // 未ソート区間の残りは [pivot + 1, right]
            left = pivot + 1;
        } else {
            // 右部分配列を再帰的にソート
            quickSortTailCall(nums, pivot + 1, right);
            // 未ソート区間の残りは [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Driver Code */
int main() {
    /* クイックソート */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("クイックソート完了後 nums = ");
    printArray(nums, size);

    /* クイックソート（中央値の基準値で最適化） */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("クイックソート（中央値ピボット最適化）完了後 nums = ");
    printArray(nums1, size);

    /* クイックソート（再帰深度最適化） */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("クイックソート（再帰深度最適化）完了後 nums = ");
    printArray(nums1, size);

    return 0;
}
