/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class insertion_sort {
    /* Insertion sort */
    void InsertionSort(int[] nums) {
        // Outer loop: sorted interval is [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = bas;         // Assign base to the correct position
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        InsertionSort(nums);
        Console.WriteLine("After insertion sort completes, nums = " + string.Join(",", nums));
    }
}
