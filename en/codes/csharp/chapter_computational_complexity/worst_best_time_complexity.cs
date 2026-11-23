/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Randomly shuffle the array elements
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Find the index of the number 1 in array nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Driver code */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\nArray [ 1, 2, ..., n ] after shuffling = " + string.Join(",", nums));
            Console.WriteLine("The index of the number 1 is " + index);
        }
    }
}
