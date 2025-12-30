/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void CountingSortDigit(int[] nums, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        int[] counter = new int[10];
        int n = nums.Length;
        // Count the occurrence of digits 0~9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++;                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    void RadixSort(int[] nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Traverse from the lowest to the highest digit
        for (int exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // Radix sort
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("After radix sort completes, nums = " + string.Join(" ", nums));
    }
}
