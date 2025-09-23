/**
 * File: quick_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

/* クイックソートクラス */
class QuickSort {
    /* 要素を交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 分割 */
    static int partition(int[] nums, int left, int right) {
        // nums[left] を基準値として使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、基準値より小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、基準値より大きい最初の要素を検索
            swap(nums, i, j); // これら2つの要素を交換
        }
        swap(nums, i, left);  // 基準値を2つの部分配列の境界に交換
        return i;             // 基準値のインデックスを返す
    }

    /* クイックソート */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 のとき再帰を終了
        if (left >= right)
            return;
        // 分割
        int pivot = partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値基準最適化） */
class QuickSortMedian {
    /* 要素を交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 3つの候補要素の中央値を選択 */
    static int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m は l と r の間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l は m と r の間
        return right;
    }

    /* 分割（3つの中央値） */
    static int partition(int[] nums, int left, int right) {
        // 3つの候補要素の中央値を選択
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の最左端の位置に交換
        swap(nums, left, med);
        // nums[left] を基準値として使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、基準値より小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、基準値より大きい最初の要素を検索
            swap(nums, i, j); // これら2つの要素を交換
        }
        swap(nums, i, left);  // 基準値を2つの部分配列の境界に交換
        return i;             // 基準値のインデックスを返す
    }

    /* クイックソート */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 のとき再帰を終了
        if (left >= right)
            return;
        // 分割
        int pivot = partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（末尾再帰最適化） */
class QuickSortTailCall {
    /* 要素を交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 分割 */
    static int partition(int[] nums, int left, int right) {
        // nums[left] を基準値として使用
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、基準値より小さい最初の要素を検索
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、基準値より大きい最初の要素を検索
            swap(nums, i, j); // これら2つの要素を交換
        }
        swap(nums, i, left);  // 基準値を2つの部分配列の境界に交換
        return i;             // 基準値のインデックスを返す
    }

    /* クイックソート（末尾再帰最適化） */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 のとき終了
        while (left < right) {
            // 分割操作
            int pivot = partition(nums, left, right);
            // 2つの部分配列のうち短い方にクイックソートを実行
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 左部分配列を再帰的にソート
                left = pivot + 1; // 残りの未ソート区間は [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソート
                right = pivot - 1; // 残りの未ソート区間は [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    public static void main(String[] args) {
        /* クイックソート */
        int[] nums = { 2, 4, 1, 0, 3, 5 };
        QuickSort.quickSort(nums, 0, nums.length - 1);
        System.out.println("クイックソート後、nums = " + Arrays.toString(nums));

        /* クイックソート（中央値基準最適化） */
        int[] nums1 = { 2, 4, 1, 0, 3, 5 };
        QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
        System.out.println("中央値基準最適化クイックソート後、nums1 = " + Arrays.toString(nums1));

        /* クイックソート（末尾再帰最適化） */
        int[] nums2 = { 2, 4, 1, 0, 3, 5 };
        QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
        System.out.println("末尾再帰最適化クイックソート後、nums2 = " + Arrays.toString(nums2));
    }
}