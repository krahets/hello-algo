/**
 * File: merge_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class merge_sort {
    /* 左部分配列と右部分配列をマージ */
    void Merge(int[] nums, int left, int mid, int right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ結果を格納する一時配列 tmp を作成
        int[] tmp = new int[right - left + 1];
        // 左右の部分配列の開始インデックスを初期化する
        int i = left, j = mid + 1, k = 0;
        // 左右の部分配列にまだ要素がある間は比較し、小さいほうを一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左右の部分配列の残り要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応区間にコピーする
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void MergeSort(int[] nums, int left, int right) {
        // 終了条件
        if (left >= right) return;       // 部分配列の長さが 1 になったら再帰を終了
        // 分割フェーズ
        int mid = left + (right - left) / 2;    // 中点を計算
        MergeSort(nums, left, mid);      // 左部分配列を再帰処理
        MergeSort(nums, mid + 1, right); // 右部分配列を再帰処理
        // マージフェーズ
        Merge(nums, left, mid, right);
    }

    [Test]
    public void Test() {
        /* マージソート */
        int[] nums = [7, 3, 2, 6, 0, 1, 5, 4];
        MergeSort(nums, 0, nums.Length - 1);
        Console.WriteLine("マージソート完了後 nums = " + string.Join(",", nums));
    }
}
