/**
 * File: merge_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class merge_sort {
    /* 左部分配列と右部分配列をマージ */
    static void merge(int[] nums, int left, int mid, int right) {
        // 左部分配列区間は [left, mid]、右部分配列区間は [mid+1, right]
        // 一時配列 tmp を作成してマージ結果を格納
        int[] tmp = new int[right - left + 1];
        // 左右部分配列の開始インデックスを初期化
        int i = left, j = mid + 1, k = 0;
        // 両部分配列にまだ要素がある間、比較してより小さい要素を一時配列にコピー
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左右部分配列の残りの要素を一時配列にコピー
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーバック
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    static void mergeSort(int[] nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // 部分配列の長さが 1 のとき再帰を終了
        // 分割段階
        int mid = left + (right - left) / 2; // 中点を計算
        mergeSort(nums, left, mid); // 左部分配列を再帰的に処理
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理
        // マージ段階
        merge(nums, left, mid, right);
    }

    public static void main(String[] args) {
        /* マージソート */
        int[] nums = { 7, 3, 2, 6, 0, 1, 5, 4 };
        mergeSort(nums, 0, nums.length - 1);
        System.out.println("マージソート後、nums = " + Arrays.toString(nums));
    }
}