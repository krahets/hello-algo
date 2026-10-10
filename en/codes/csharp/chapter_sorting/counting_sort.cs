/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void CountingSortNaive(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void CountingSort(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("After counting sort (cannot sort objects) completes, nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("After counting sort completes, nums1 = " + string.Join(" ", nums));
    }
}
