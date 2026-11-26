/**
 * File: merge_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Merge the left and right subarrays */
function merge(nums: number[], left: number, mid: number, right: number): void {
    // The left subarray spans [left, mid] and the right spans [mid+1, right]
    // Create a temporary array tmp for the merged result
    const tmp = new Array(right - left + 1);
    // Initialize the starting indices of the left and right subarrays
    let i = left,
        j = mid + 1,
        k = 0;
    // While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Copy any remaining elements from either subarray to the temporary array
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Copy tmp back into the corresponding range of nums
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* Merge sort */
function mergeSort(nums: number[], left: number, right: number): void {
    // Base case
    if (left >= right) return; // Stop recursing when the subarray has length 1
    // Divide
    let mid = Math.floor(left + (right - left) / 2); // Find the midpoint
    mergeSort(nums, left, mid); // Recurse on the left subarray
    mergeSort(nums, mid + 1, right); // Recurse on the right subarray
    // Merge
    merge(nums, left, mid, right);
}

/* Driver Code */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('After merge sort, nums =', nums);

export {};
