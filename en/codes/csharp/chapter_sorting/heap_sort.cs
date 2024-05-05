/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* Heap length is n, start heapifying node i, from top to bottom */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i)
                break;
            // Swap two nodes
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    void HeapSort(int[] nums) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = nums.Length - 1; i > 0; i--) {
            // Swap the root node with the rightmost leaf node (swap the first element with the last element)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Start heapifying the root node, from top to bottom
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("After heap sorting, nums = " + string.Join(" ", nums));
    }
}
