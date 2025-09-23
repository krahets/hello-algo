/**
 * File: binary_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search {
    /* 二分探索（両端閉区間） */
    static int binarySearch(int[] nums, int target) {
        // 両端閉区間 [0, n-1] を初期化、すなわち i, j はそれぞれ配列の最初の要素と最後の要素を指す
        int i = 0, j = nums.length - 1;
        // 探索区間が空になるまでループ（i > j のとき空）
        while (i <= j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) // この状況は target が区間 [m+1, j] にあることを示す
                i = m + 1;
            else if (nums[m] > target) // この状況は target が区間 [i, m-1] にあることを示す
                j = m - 1;
            else // 目標要素を見つけたので、そのインデックスを返す
                return m;
        }
        // 目標要素を見つけられなかったので、-1 を返す
        return -1;
    }

    /* 二分探索（左閉右開区間） */
    static int binarySearchLCRO(int[] nums, int target) {
        // 左閉右開区間 [0, n) を初期化、すなわち i, j はそれぞれ配列の最初の要素と最後の要素+1を指す
        int i = 0, j = nums.length;
        // 探索区間が空になるまでループ（i = j のとき空）
        while (i < j) {
            int m = i + (j - i) / 2; // 中点インデックス m を計算
            if (nums[m] < target) // この状況は target が区間 [m+1, j) にあることを示す
                i = m + 1;
            else if (nums[m] > target) // この状況は target が区間 [i, m) にあることを示す
                j = m;
            else // 目標要素を見つけたので、そのインデックスを返す
                return m;
        }
        // 目標要素を見つけられなかったので、-1 を返す
        return -1;
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        /* 二分探索（両端閉区間） */
        int index = binarySearch(nums, target);
        System.out.println("目標要素 6 のインデックス = " + index);

        /* 二分探索（左閉右開区間） */
        index = binarySearchLCRO(nums, target);
        System.out.println("目標要素 6 のインデックス = " + index);
    }
}