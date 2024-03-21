/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* 二分搜尋最左一個 target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // 等價於查詢 target 的插入點
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // 未找到 target ，返回 -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // 找到 target ，返回索引 i
        return i;
    }

    /* 二分搜尋最右一個 target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 轉化為查詢最左一個 target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j 指向最右一個 target ，i 指向首個大於 target 的元素
        int j = i - 1;
        // 未找到 target ，返回 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target ，返回索引 j
        return j;
    }

    [Test]
    public void Test() {
        // 包含重複元素的陣列
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n陣列 nums = " + nums.PrintList());

        // 二分搜尋左邊界和右邊界
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("最左一個元素 " + target + " 的索引為 " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("最右一個元素 " + target + " 的索引為 " + index);
        }
    }
}
