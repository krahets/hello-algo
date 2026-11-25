/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* Sift down from node i in a heap of size n */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // Let ma be the index of the largest of nodes i, l, and r
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Stop if i is the largest or both child indices l and r are out of bounds
            if (ma == i)
                break;
            // Swap the two nodes
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Continue sifting down
            i = ma;
        }
    }

    /* Heap sort */
    void HeapSort(int[] nums) {
        // Build the heap by sifting down from each non-leaf node
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Extract the maximum from the heap in each of n-1 rounds
        for (int i = nums.Length - 1; i > 0; i--) {
            // Swap the root and rightmost leaf (the first and last elements)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Sift down from the root
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("After heap sort, nums = " + string.Join(" ", nums));
    }
}
