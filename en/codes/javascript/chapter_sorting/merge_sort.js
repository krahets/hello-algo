/**
 * File: merge_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Merge the left and right subarrays */
function merge(nums, left, mid, right) {
    // The left subarray spans [left, mid], and the right subarray spans [mid+1, right]
    // Create a temporary array tmp to store the merged result
    const tmp = new Array(right - left + 1);
    // Initialize the starting indices of the left and right subarrays
    let i = left,
        j = mid + 1,
        k = 0;
    // While both subarrays have elements remaining, compare them and copy the smaller element into the temporary array
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
    // Copy the elements of temporary array tmp back into the corresponding range of the original array nums
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* Merge sort */
function mergeSort(nums, left, right) {
    // Base case
    if (left >= right) return; // Stop recursing when the subarray has at most one element
    // Divide phase
    let mid = Math.floor(left + (right - left) / 2); // Calculate the midpoint
    mergeSort(nums, left, mid); // Recurse on the left subarray
    mergeSort(nums, mid + 1, right); // Recurse on the right subarray
    // Merge phase
    merge(nums, left, mid, right);
}

/* Driver code */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('After merge sort, nums =', nums);
