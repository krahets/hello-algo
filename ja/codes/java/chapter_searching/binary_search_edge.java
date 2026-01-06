/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* 最も左の target を二分探索 */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // target の挿入点を見つけることと等価
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target を見つけられなかったので、-1 を返す
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // target を見つけたので、インデックス i を返す
        return i;
    }

    /* 最も右の target を二分探索 */
    static int binarySearchRightEdge(int[] nums, int target) {
        // 最も左の target + 1 を見つけることに変換
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j は最も右の target を指し、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target を見つけられなかったので、-1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target を見つけたので、インデックス j を返す
        return j;
    }

    public static void main(String[] args) {
        // 重複要素を含む配列
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n配列 nums = " + java.util.Arrays.toString(nums));

        // 左右の境界を二分探索
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("要素 " + target + " の最も左のインデックスは " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("要素 " + target + " の最も右のインデックスは " + index);
        }
    }
}