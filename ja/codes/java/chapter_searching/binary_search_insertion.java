/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* 二分探索による挿入位置の探索（重複要素がない場合） */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                return m; // target が見つかったので、挿入位置 m を返す
            }
        }
        // target が見つからなかったので、挿入位置 i を返す
        return i;
    }

    /* 二分探索による挿入位置の探索（重複要素がある場合） */
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] を初期化する
        while (i <= j) {
            int m = i + (j - i) / 2; // 中央のインデックス m を計算する
            if (nums[m] < target) {
                i = m + 1; // target は区間 [m+1, j] に存在する
            } else if (nums[m] > target) {
                j = m - 1; // target は区間 [i, m-1] に存在する
            } else {
                j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
            }
        }
        // 挿入位置 i を返す
        return i;
    }

    public static void main(String[] args) {
        // 重複要素のない配列
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));
        // 二分探索による挿入位置の探索
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("要素 " + target + " の挿入位置のインデックスは " + index);
        }

        // 重複要素を含む配列
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));
        // 二分探索による挿入位置の探索
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("要素 " + target + " の挿入位置のインデックスは " + index);
        }
    }
}
