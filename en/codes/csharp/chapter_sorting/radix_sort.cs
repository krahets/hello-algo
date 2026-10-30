/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void CountingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        int[] counter = new int[10];
        int n = nums.Length;
        // Count the occurrences of each digit from 0 to 9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++;                // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    void RadixSort(int[] nums) {
        // Get the largest array element to determine the maximum number of digits
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Process digits from least significant to most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // Radix sort
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("After radix sort, nums = " + string.Join(" ", nums));
    }
}
