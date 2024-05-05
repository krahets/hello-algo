/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* Bubble sort */
    void BubbleSort(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* Bubble sort (optimized with flag)*/
    void BubbleSortWithFlag(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Record swapped elements
                }
            }
            if (!flag) break;     // If no elements were swapped in this round of "bubbling", exit
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("After bubble sorting, nums = " + string.Join(", ", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("After bubble sorting nums1 = " + string.Join(", ", nums1));
    }
}
