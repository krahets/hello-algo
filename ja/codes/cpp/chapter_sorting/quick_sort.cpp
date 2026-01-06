/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* クイックソートクラス */
class QuickSort {
  private:
    /* 要素を交換 */
    static void swap(vector<int> &nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left]をピボットとして使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 右から左へピボットより小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へピボットより大きい最初の要素を検索
            swap(nums, i, j); // これら二つの要素を交換
        }
        swap(nums, i, left); // ピボットを二つのサブ配列の境界に交換
        return i;            // ピボットのインデックスを返す
    }

  public:
    /* クイックソート */
    static void quickSort(vector<int> &nums, int left, int right) {
        // サブ配列の長さが1の時、再帰を終了
        if (left >= right)
            return;
        // 分割
        int pivot = partition(nums, left, right);
        // 左サブ配列と右サブ配列を再帰的に処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* クイックソートクラス（中央値ピボット最適化） */
class QuickSortMedian {
  private:
    /* 要素を交換 */
    static void swap(vector<int> &nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 三つの候補要素の中央値を選択 */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // mはlとrの間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // lはmとrの間
        return right;
    }

    /* 分割（三つの中央値） */
    static int partition(vector<int> &nums, int left, int right) {
        // 三つの候補要素の中央値を選択
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の最左位置に交換
        swap(nums, left, med);
        // nums[left]をピボットとして使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 右から左へピボットより小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へピボットより大きい最初の要素を検索
            swap(nums, i, j); // これら二つの要素を交換
        }
        swap(nums, i, left); // ピボットを二つのサブ配列の境界に交換
        return i;            // ピボットのインデックスを返す
    }

  public:
    /* クイックソート */
    static void quickSort(vector<int> &nums, int left, int right) {
        // サブ配列の長さが1の時、再帰を終了
        if (left >= right)
            return;
        // 分割
        int pivot = partition(nums, left, right);
        // 左サブ配列と右サブ配列を再帰的に処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* クイックソートクラス（末尾再帰最適化） */
class QuickSortTailCall {
  private:
    /* 要素を交換 */
    static void swap(vector<int> &nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 分割 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left]をピボットとして使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // 右から左へピボットより小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へピボットより大きい最初の要素を検索
            swap(nums, i, j); // これら二つの要素を交換
        }
        swap(nums, i, left); // ピボットを二つのサブ配列の境界に交換
        return i;            // ピボットのインデックスを返す
    }

  public:
    /* クイックソート（末尾再帰最適化） */
    static void quickSort(vector<int> &nums, int left, int right) {
        // サブ配列の長さが1の時終了
        while (left < right) {
            // 分割操作
            int pivot = partition(nums, left, right);
            // 二つのサブ配列のうち短い方でクイックソートを実行
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 左サブ配列を再帰的にソート
                left = pivot + 1;                 // 残りの未ソート区間は[pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 右サブ配列を再帰的にソート
                right = pivot - 1;                 // 残りの未ソート区間は[left, pivot - 1]
            }
        }
    }
};

/* ドライバコード */
int main() {
    /* クイックソート */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "クイックソート後、nums = ";
    printVector(nums);

    /* クイックソート（中央値ピボット最適化） */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "クイックソート（中央値ピボット最適化）完了、nums = ";
    printVector(nums1);

    /* クイックソート（末尾再帰最適化） */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "クイックソート（末尾再帰最適化）完了、nums = ";
    printVector(nums2);

    return 0;
}