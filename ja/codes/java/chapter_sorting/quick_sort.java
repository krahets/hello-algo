/**
 * File: quick_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

/* クイックソートクラス */
class QuickSort {
    /* 要素の交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵を用いた分割 */
    static int partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            swap(nums, i, j); // この 2 つの要素を交換する
        }
        swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right)
            return;
        // 番兵を用いた分割
        int pivot = partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（中央値ピボットによる最適化） */
class QuickSortMedian {
    /* 要素の交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 候補となる 3 要素の中央値を選ぶ */
    static int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m が l と r の間にある
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l が m と r の間にある
        return right;
    }

    /* 番兵を用いた分割（3 値の中央値を選択） */
    static int partition(int[] nums, int left, int right) {
        // 候補となる 3 要素の中央値を選ぶ
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の左端に移す
        swap(nums, left, med);
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            swap(nums, i, j); // この 2 つの要素を交換する
        }
        swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら再帰を終了する
        if (left >= right)
            return;
        // 番兵を用いた分割
        int pivot = partition(nums, left, right);
        // 左部分配列と右部分配列を再帰的に処理する
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* クイックソートクラス（再帰の深さの最適化） */
class QuickSortTailCall {
    /* 要素の交換 */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* 番兵を用いた分割 */
    static int partition(int[] nums, int left, int right) {
        // nums[left] をピボットとする
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 右から左へ、ピボットより小さい最初の要素を探す
            while (i < j && nums[i] <= nums[left])
                i++;          // 左から右へ、ピボットより大きい最初の要素を探す
            swap(nums, i, j); // この 2 つの要素を交換する
        }
        swap(nums, i, left);  // ピボットを 2 つの部分配列の境界に移す
        return i;             // ピボットのインデックスを返す
    }

    /* クイックソート（再帰の深さの最適化） */
    public static void quickSort(int[] nums, int left, int right) {
        // 部分配列の長さが 1 になったら終了する
        while (left < right) {
            // 番兵を用いた分割操作
            int pivot = partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 左部分配列を再帰的にソートする
                left = pivot + 1; // 残りの未ソート区間は [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // 右部分配列を再帰的にソートする
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
        System.out.println("クイックソート完了後 nums = " + Arrays.toString(nums));

        /* クイックソート（中央値ピボットによる最適化） */
        int[] nums1 = { 2, 4, 1, 0, 3, 5 };
        QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
        System.out.println("クイックソート（中央値ピボットによる最適化）の完了後 nums1 = " + Arrays.toString(nums1));

        /* クイックソート（再帰の深さの最適化） */
        int[] nums2 = { 2, 4, 1, 0, 3, 5 };
        QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
        System.out.println("クイックソート（再帰の深さの最適化）の完了後 nums2 = " + Arrays.toString(nums2));
    }
}
