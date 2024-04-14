/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 元素交換 */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* 哨兵劃分 */
int partition(int nums[], int left, int right) {
    // 以 nums[left] 為基準數
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // 從右向左找首個小於基準數的元素
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // 從左向右找首個大於基準數的元素
        }
        // 交換這兩個元素
        swap(nums, i, j);
    }
    // 將基準數交換至兩子陣列的分界線
    swap(nums, i, left);
    // 返回基準數的索引
    return i;
}

/* 快速排序 */
void quickSort(int nums[], int left, int right) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right) {
        return;
    }
    // 哨兵劃分
    int pivot = partition(nums, left, right);
    // 遞迴左子陣列、右子陣列
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// 以下為中位數最佳化的快速排序

/* 選取三個候選元素的中位數 */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m 在 l 和 r 之間
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l 在 m 和 r 之間
    return right;
}

/* 哨兵劃分（三數取中值） */
int partitionMedian(int nums[], int left, int right) {
    // 選取三個候選元素的中位數
    int med = medianThree(nums, left, (left + right) / 2, right);
    // 將中位數交換至陣列最左端
    swap(nums, left, med);
    // 以 nums[left] 為基準數
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // 從右向左找首個小於基準數的元素
        while (i < j && nums[i] <= nums[left])
            i++;          // 從左向右找首個大於基準數的元素
        swap(nums, i, j); // 交換這兩個元素
    }
    swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
    return i;            // 返回基準數的索引
}

/* 快速排序（三數取中值） */
void quickSortMedian(int nums[], int left, int right) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right)
        return;
    // 哨兵劃分
    int pivot = partitionMedian(nums, left, right);
    // 遞迴左子陣列、右子陣列
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// 以下為尾遞迴最佳化的快速排序

/* 快速排序（尾遞迴最佳化） */
void quickSortTailCall(int nums[], int left, int right) {
    // 子陣列長度為 1 時終止
    while (left < right) {
        // 哨兵劃分操作
        int pivot = partition(nums, left, right);
        // 對兩個子陣列中較短的那個執行快速排序
        if (pivot - left < right - pivot) {
            // 遞迴排序左子陣列
            quickSortTailCall(nums, left, pivot - 1);
            // 剩餘未排序區間為 [pivot + 1, right]
            left = pivot + 1;
        } else {
            // 遞迴排序右子陣列
            quickSortTailCall(nums, pivot + 1, right);
            // 剩餘未排序區間為 [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Driver Code */
int main() {
    /* 快速排序 */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("快速排序完成後 nums = ");
    printArray(nums, size);

    /* 快速排序（中位基準數最佳化） */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("快速排序（中位基準數最佳化）完成後 nums = ");
    printArray(nums1, size);

    /* 快速排序（尾遞迴最佳化） */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("快速排序（尾遞迴最佳化）完成後 nums = ");
    printArray(nums1, size);

    return 0;
}
