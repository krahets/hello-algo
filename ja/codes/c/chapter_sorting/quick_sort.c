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

/* 番兵を用いた分割 */
int partition(int nums[], int left, int right) {
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // 右から左へ、ピボットより小さい最初の要素を探す
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // 左から右へ、ピボットより大きい最初の要素を探す
        }
        // この 2 つの要素を交換する
        swap(nums, i, j);
    }
    // ピボットを 2 つの部分配列の境界に移す
    swap(nums, i, left);
    // ピボットのインデックスを返す
    return i;
}

/* クイックソート */
void quickSort(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了する
    if (left >= right) {
        return;
    }
    // 番兵を用いた分割
    int pivot = partition(nums, left, right);
    // 左部分配列と右部分配列を再帰的に処理する
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// 以下は中央値によって最適化したクイックソート

/* 候補となる 3 要素の中央値を選ぶ */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m が l と r の間にある
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l が m と r の間にある
    return right;
}

/* 番兵を用いた分割（3 値の中央値を選択） */
int partitionMedian(int nums[], int left, int right) {
    // 候補となる 3 要素の中央値を選ぶ
    int med = medianThree(nums, left, (left + right) / 2, right);
    // 中央値を配列の左端に移す
    swap(nums, left, med);
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // 右から左へ、ピボットより小さい最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++;          // 左から右へ、ピボットより大きい最初の要素を探す
        swap(nums, i, j); // この 2 つの要素を交換する
    }
    swap(nums, i, left); // ピボットを 2 つの部分配列の境界に移す
    return i;            // ピボットのインデックスを返す
}

/* クイックソート（3 値の中央値を選択） */
void quickSortMedian(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了する
    if (left >= right)
        return;
    // 番兵を用いた分割
    int pivot = partitionMedian(nums, left, right);
    // 左部分配列と右部分配列を再帰的に処理する
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// 以下は再帰の深さを最適化したクイックソート

/* クイックソート（再帰の深さの最適化） */
void quickSortTailCall(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら終了する
    while (left < right) {
        // 番兵を用いた分割操作
        int pivot = partition(nums, left, right);
        // 2 つの部分配列のうち短いほうにクイックソートを適用する
        if (pivot - left < right - pivot) {
            // 左部分配列を再帰的にソートする
            quickSortTailCall(nums, left, pivot - 1);
            // 残りの未ソート区間は [pivot + 1, right]
            left = pivot + 1;
        } else {
            // 右部分配列を再帰的にソートする
            quickSortTailCall(nums, pivot + 1, right);
            // 残りの未ソート区間は [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* 実行用コード */
int main() {
    /* クイックソート */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("クイックソート完了後 nums = ");
    printArray(nums, size);

    /* クイックソート（中央値ピボットによる最適化） */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("クイックソート（中央値ピボットによる最適化）の完了後 nums = ");
    printArray(nums1, size);

    /* クイックソート（再帰の深さの最適化） */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("クイックソート（再帰の深さの最適化）の完了後 nums = ");
    printArray(nums1, size);

    return 0;
}
