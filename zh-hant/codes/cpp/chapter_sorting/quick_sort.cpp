/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 快速排序類別 */
class QuickSort {
  private:
    /* 哨兵分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;                // 從左向右尋找第一個大於基準值的元素
            swap(nums[i], nums[j]); // 交換這兩個元素
        }
        swap(nums[i], nums[left]);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i;                   // 回傳基準值的索引
    }

  public:
    /* 快速排序 */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right)
            return;
        // 哨兵分割
        int pivot = partition(nums, left, right);
        // 遞迴處理左、右子陣列
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 快速排序類別（以中位數作為基準值的最佳化） */
class QuickSortMedian {
  private:
    /* 取三個候選元素的中位數 */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 介於 l 和 r 之間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 介於 m 和 r 之間
        return right;
    }

    /* 哨兵分割（三數取中） */
    static int partition(vector<int> &nums, int left, int right) {
        // 取三個候選元素的中位數
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 將中位數與陣列最左端的元素交換
        swap(nums[left], nums[med]);
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;                // 從左向右尋找第一個大於基準值的元素
            swap(nums[i], nums[j]); // 交換這兩個元素
        }
        swap(nums[i], nums[left]);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i;                   // 回傳基準值的索引
    }

  public:
    /* 快速排序 */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right)
            return;
        // 哨兵分割
        int pivot = partition(nums, left, right);
        // 遞迴處理左、右子陣列
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 快速排序類別（遞迴深度最佳化） */
class QuickSortTailCall {
  private:
    /* 哨兵分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;                // 從左向右尋找第一個大於基準值的元素
            swap(nums[i], nums[j]); // 交換這兩個元素
        }
        swap(nums[i], nums[left]);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i;                   // 回傳基準值的索引
    }

  public:
    /* 快速排序（遞迴深度最佳化） */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 子陣列長度為 1 時終止
        while (left < right) {
            // 執行哨兵分割
            int pivot = partition(nums, left, right);
            // 對兩個子陣列中較短的一個執行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 遞迴排序左子陣列
                left = pivot + 1;                 // 剩餘的未排序區間為 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 遞迴排序右子陣列
                right = pivot - 1;                 // 剩餘的未排序區間為 [left, pivot - 1]
            }
        }
    }
};

/* 主程式 */
int main() {
    /* 快速排序 */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "快速排序完成後 nums = ";
    printVector(nums);

    /* 快速排序（以中位數作為基準值的最佳化） */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "快速排序（以中位數作為基準值的最佳化）完成後 nums = ";
    printVector(nums1);

    /* 快速排序（遞迴深度最佳化） */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "快速排序（遞迴深度最佳化）完成後 nums = ";
    printVector(nums2);

    return 0;
}
