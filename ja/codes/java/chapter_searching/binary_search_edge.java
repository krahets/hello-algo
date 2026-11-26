/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* 最も左にある target の二分探索 */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すことと同じ
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target が見つからなかったので -1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target が見つかったのでインデックス i を返す
        return i;
    }

    /* 最も右にある target の二分探索 */
    static int binarySearchRightEdge(int[] nums, int target) {
        // 最も左にある target + 1 の探索に置き換える
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右の target を、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので -1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったのでインデックス j を返す
        return j;
    }

    public static void main(String[] args) {
        // 重複する要素がある配列
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));

        // 左端と右端の二分探索
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("最も左にある " + target + " のインデックスは " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("最も右にある " + target + " のインデックスは " + index);
        }
    }
}
