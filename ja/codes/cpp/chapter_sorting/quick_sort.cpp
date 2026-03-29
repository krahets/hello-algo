/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* クイックソートクラス */
class QuickSort {
  private:
    /* 番兵分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left] を基準値とする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 右から左へ基準値未満の最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;                // 左から右へ基準値より大きい最初の要素を探す
            swap(nums[i], nums[j]); // この 2 つの要素を交換
        }
        swap(nums[i], nums[left]);  // 基準値を 2 つの部分配列の境界へ交換する
        return i;                   // 基準値のインデックスを返す
    }

  public:
    /* クイックソート */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right)
            return;
        // 番兵分割
        int pivot = partition(nums, left, right);
        // 左右の部分配列を再帰処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* クイックソートクラス（中央値ピボット最適化） */
class QuickSortMedian {
  private:
    /* 3つの候補要素の中央値を選ぶ */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m は l と r の間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l は m と r の間
        return right;
    }

    /* 番兵による分割処理（3 点中央値） */
    static int partition(vector<int> &nums, int left, int right) {
        // 3つの候補要素の中央値を選ぶ
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の最左端に交換する
        swap(nums[left], nums[med]);
        // nums[left] を基準値とする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 右から左へ基準値未満の最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;                // 左から右へ基準値より大きい最初の要素を探す
            swap(nums[i], nums[j]); // この 2 つの要素を交換
        }
        swap(nums[i], nums[left]);  // 基準値を 2 つの部分配列の境界へ交換する
        return i;                   // 基準値のインデックスを返す
    }

  public:
    /* クイックソート */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right)
            return;
        // 番兵分割
        int pivot = partition(nums, left, right);
        // 左右の部分配列を再帰処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* クイックソートクラス（再帰深度最適化） */
class QuickSortTailCall {
  private:
    /* 番兵分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left] を基準値とする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 右から左へ基準値未満の最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;                // 左から右へ基準値より大きい最初の要素を探す
            swap(nums[i], nums[j]); // この 2 つの要素を交換
        }
        swap(nums[i], nums[left]);  // 基準値を 2 つの部分配列の境界へ交換する
        return i;                   // 基準値のインデックスを返す
    }

  public:
    /* クイックソート（再帰深度最適化） */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 部分配列の長さが 1 なら終了
        while (left < right) {
            // 番兵による分割処理
            int pivot = partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 左部分配列を再帰的にソート
                left = pivot + 1;                 // 未ソート区間の残りは [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソート
                right = pivot - 1;                 // 未ソート区間の残りは [left, pivot - 1]
            }
        }
    }
};

/* Driver Code */
int main() {
    /* クイックソート */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "クイックソート完了後 nums = ";
    printVector(nums);

    /* クイックソート（中央値の基準値で最適化） */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "クイックソート（中央値ピボット最適化）完了後 nums = ";
    printVector(nums1);

    /* クイックソート（再帰深度最適化） */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "クイックソート（再帰深度最適化）完了後 nums = ";
    printVector(nums2);

    return 0;
}
