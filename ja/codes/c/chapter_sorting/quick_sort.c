/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 要素を交換 */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* 左右から走査して分割 */
int partition(int nums[], int left, int right) {
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // 右から左へ走査し、ピボットより小さい最初の要素を探す
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // 左から右へ走査し、ピボットより大きい最初の要素を探す
        }
        // この 2 要素を交換
        swap(nums, i, j);
    }
    // ピボットを交換して左右の部分配列の境界に移す
    swap(nums, i, left);
    // ピボットのインデックスを返す
    return i;
}

/* クイックソート */
void quickSort(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right) {
        return;
    }
    // 左右から走査して分割
    int pivot = partition(nums, left, right);
    // 左右の部分配列を再帰的に処理
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// 以下はピボットに中央値を使うクイックソート

/* 3 つの候補の中央値を選ぶ */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m の値は l と r の値の間にある
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l の値は m と r の値の間にある
    return right;
}

/* 左右から走査して分割（3 要素の中央値を使用） */
int partitionMedian(int nums[], int left, int right) {
    // 3 つの候補の中央値を選ぶ
    int med = medianThree(nums, left, (left + right) / 2, right);
    // 中央値の要素を配列の左端に移す
    swap(nums, left, med);
    // nums[left] をピボットとする
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // 右から左へ走査し、ピボットより小さい最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++;          // 左から右へ走査し、ピボットより大きい最初の要素を探す
        swap(nums, i, j); // この 2 要素を交換
    }
    swap(nums, i, left); // ピボットを交換して左右の部分配列の境界に移す
    return i;            // ピボットのインデックスを返す
}

/* クイックソート（3 要素の中央値を使用） */
void quickSortMedian(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right)
        return;
    // 左右から走査して分割
    int pivot = partitionMedian(nums, left, right);
    // 左右の部分配列を再帰的に処理
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// 以下は再帰の深さを抑えたクイックソート

/* クイックソート（再帰の深さを最適化） */
void quickSortTailCall(int nums[], int left, int right) {
    // 部分配列の長さが 1 になったら終了
    while (left < right) {
        // 左右から走査して分割
        int pivot = partition(nums, left, right);
        // 短いほうの部分配列にクイックソートを適用
        if (pivot - left < right - pivot) {
            // 左の部分配列を再帰的にソート
            quickSortTailCall(nums, left, pivot - 1);
            // 残りの未整列区間は [pivot + 1, right]
            left = pivot + 1;
        } else {
            // 右の部分配列を再帰的にソート
            quickSortTailCall(nums, pivot + 1, right);
            // 残りの未整列区間は [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* 実行例 */
int main() {
    /* クイックソート */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("クイックソート後の nums = ");
    printArray(nums, size);

    /* クイックソート（中央値をピボットに使用） */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("クイックソート（中央値をピボットに使用）後の nums = ");
    printArray(nums1, size);

    /* クイックソート（再帰の深さを最適化） */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("クイックソート（再帰の深さを最適化）後の nums = ");
    printArray(nums1, size);

    return 0;
}
