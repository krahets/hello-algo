/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* 二分搜尋最左一個 target */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // 等價於查詢 target 的插入點
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }

    /* 二分搜尋最右一個 target */
    static int binarySearchRightEdge(int[] nums, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }

    public static void main(String[] args) {
        // 包含重複元素的陣列
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\n陣列 nums = " + java.util.Arrays.toString(nums));

        // 二分搜尋左邊界和右邊界
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("最左一個元素 " + target + " 的索引為 " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("最右一個元素 " + target + " 的索引為 " + index);
        }
    }
}
