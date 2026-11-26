/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Generate a shuffled array containing { 1, 2, ..., n } */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Shuffle the array elements at random
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Find the index of 1 in the array nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // Best case: 1 is the first element, so the search takes O(1) time
            // Worst case: 1 is the last element, so the search takes O(n) time
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
            Console.WriteLine("\nShuffled array [ 1, 2, ..., n ] = " + string.Join(",", nums));
            Console.WriteLine("Index of 1 = " + index);
        }
    }
}
