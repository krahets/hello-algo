/**
 * File: merge_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Merge left subarray and right subarray */
function merge(nums, left, mid, right) {
    // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    // Create a temporary array tmp to store the merged results
    const tmp = new Array(right - left + 1);
    // Initialize the start indices of the left and right subarrays
    let i = left,
        j = mid + 1,
        k = 0;
    // While both subarrays still have elements, compare and copy the smaller element into the temporary array
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Copy the remaining elements of the left and right subarrays into the temporary array
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* Merge sort */
function mergeSort(nums, left, right) {
    // Termination condition
    if (left >= right) return; // Terminate recursion when subarray length is 1
    // Divide and conquer stage
    let mid = Math.floor(left + (right - left) / 2); // Calculate midpoint
    mergeSort(nums, left, mid); // Recursively process the left subarray
    mergeSort(nums, mid + 1, right); // Recursively process the right subarray
    // Merge stage
    merge(nums, left, mid, right);
}

/* Driver Code */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('After merge sort, nums =', nums);
