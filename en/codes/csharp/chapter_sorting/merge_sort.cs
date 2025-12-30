/**
 * File: merge_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class merge_sort {
    /* Merge left subarray and right subarray */
    void Merge(int[] nums, int left, int mid, int right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        int[] tmp = new int[right - left + 1];
        // Initialize the start indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    void MergeSort(int[] nums, int left, int right) {
        // Termination condition
        if (left >= right) return;       // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        int mid = left + (right - left) / 2;    // Calculate midpoint
        MergeSort(nums, left, mid);      // Recursively process the left subarray
        MergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        Merge(nums, left, mid, right);
    }

    [Test]
    public void Test() {
        /* Merge sort */
        int[] nums = [7, 3, 2, 6, 0, 1, 5, 4];
        MergeSort(nums, 0, nums.Length - 1);
        Console.WriteLine("After merge sort completes, nums = " + string.Join(",", nums));
    }
}
