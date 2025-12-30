/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Generate an array with elements { 1, 2, ..., n }, order shuffled */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Randomly shuffle array elements
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Find the index of number 1 in array nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // When element 1 is at the head of the array, best time complexity O(1) is achieved
            // When element 1 is at the tail of the array, worst time complexity O(n) is achieved
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Driver Code */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\nArray [ 1, 2, ..., n ] after shuffling = " + string.Join(",", nums));
            Console.WriteLine("Index of number 1 is " + index);
        }
    }
}
