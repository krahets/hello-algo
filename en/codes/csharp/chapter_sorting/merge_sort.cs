/**
 * File: merge_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class merge_sort {
    /* Merge the left and right subarrays */
    void Merge(int[] nums, int left, int mid, int right) {
        // The left subarray spans [left, mid] and the right spans [mid+1, right]
        // Create a temporary array tmp for the merged result
        int[] tmp = new int[right - left + 1];
        // Initialize the starting indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Copy any remaining elements from either subarray to the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy tmp back into the corresponding range of nums
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    void MergeSort(int[] nums, int left, int right) {
        // Base case
        if (left >= right) return;       // Stop recursing when the subarray has length 1
        // Divide
        int mid = left + (right - left) / 2;    // Find the midpoint
        MergeSort(nums, left, mid);      // Recurse on the left subarray
        MergeSort(nums, mid + 1, right); // Recurse on the right subarray
        // Merge
        Merge(nums, left, mid, right);
    }

    [Test]
    public void Test() {
        /* Merge sort */
        int[] nums = [7, 3, 2, 6, 0, 1, 5, 4];
        MergeSort(nums, 0, nums.Length - 1);
        Console.WriteLine("After merge sort, nums = " + string.Join(",", nums));
    }
}
