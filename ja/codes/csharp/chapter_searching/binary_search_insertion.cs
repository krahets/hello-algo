/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* 挿入位置の二分探索（重複する要素がない場合） */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 閉区間 [0, n-1] で初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target) {
                i = m + 1; // target の探索範囲は [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target の探索範囲は [i, m-1]
            } else {
                return m; // target が見つかったので挿入位置 m を返す
            }
        }
        // target が見つからなかったので挿入位置 i を返す
        return i;
    }

    /* 挿入位置の二分探索（重複する要素がある場合） */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 閉区間 [0, n-1] で初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を求める
            if (nums[m] < target) {
                i = m + 1; // target の探索範囲は [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target の探索範囲は [i, m-1]
            } else {
                j = m - 1; // target 未満の最も右の要素を [i, m-1] で探す
            }
        }
        // 挿入位置 i を返す
        return i;
    }

    [Test]
    public void Test() {
        // 重複する要素がない配列
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\n配列 nums = " + nums.PrintList());
        // 挿入位置の二分探索
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("要素 " + target + " の挿入位置のインデックスは " + index);
        }

        // 重複する要素がある配列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n配列 nums = " + nums.PrintList());
        // 挿入位置の二分探索
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("要素 " + target + " の挿入位置のインデックスは " + index);
        }
    }
}
