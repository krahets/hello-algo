/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* 最も左の target を二分探索 */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すのと等価
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target が見つからなければ、-1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target が見つかったら、インデックス i を返す
        return i;
    }

    /* 最も右の target を二分探索 */
    static int binarySearchRightEdge(int[] nums, int target) {
        // 最左の target + 1 を探す問題に変換する
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなければ、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったら、インデックス j を返す
        return j;
    }

    public static void main(String[] args) {
        // 重複要素を含む配列
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));

        // 二分探索で左端と右端を探す
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("一番左の要素 " + target + " のインデックスは " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("一番右の要素 " + target + " のインデックスは " + index);
        }
    }
}
