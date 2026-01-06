/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* 挿入点の二分探索（重複要素なし） */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 両端閉区間 [0, n-1] を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] にある
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] にある
            } else {
                return m; // target を見つけたので、挿入点 m を返す
            }
        }
        // target を見つけられなかったので、挿入点 i を返す
        return i;
    }

    /* 挿入点の二分探索（重複要素あり） */
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 両端閉区間 [0, n-1] を初期化
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] にある
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] にある
            } else {
                j = m - 1; // target より小さい最初の要素は区間 [i, m-1] にある
            }
        }
        // 挿入点 i を返す
        return i;
    }

    public static void main(String[] args) {
        // 重複要素のない配列
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));
        // 挿入点の二分探索
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("要素 " + target + " の挿入点インデックスは " + index);
        }

        // 重複要素のある配列
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));
        // 挿入点の二分探索
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("要素 " + target + " の挿入点インデックスは " + index);
        }
    }
}