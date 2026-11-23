/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* Counting sort */
    // Simple implementation; cannot be used to sort objects
    void CountingSortNaive(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    void CountingSort(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("After counting sort (does not support objects), nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("After counting sort, displayed nums = " + string.Join(" ", nums));
    }
}
