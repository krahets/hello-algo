/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* 用二分搜尋找最左邊的 target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // 等同於搜尋 target 的插入點
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // 找不到 target，回傳 -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // 找到 target，回傳索引 i
        return i;
    }

    /* 用二分搜尋找最右邊的 target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 改為搜尋 target + 1 的最左插入位置
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j 指向最右邊的 target，i 指向第一個大於 target 的元素
        int j = i - 1;
        // 找不到 target，回傳 -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // 找到 target，回傳索引 j
        return j;
    }

    [Test]
    public void Test() {
        // 含有重複元素的陣列
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n陣列 nums = " + nums.PrintList());

        // 用二分搜尋找左界和右界
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("最左邊的元素 " + target + " 的索引為 " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("最右邊的元素 " + target + " 的索引為 " + index);
        }
    }
}
