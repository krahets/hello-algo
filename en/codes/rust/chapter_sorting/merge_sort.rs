/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* Merge left subarray and right subarray */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    // Create a temporary array tmp to store the merged results
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // Initialize the start indices of the left and right subarrays
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // While both subarrays still have elements, compare and copy the smaller element into the temporary array
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // Copy the remaining elements of the left and right subarrays into the temporary array
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* Merge sort */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // Termination condition
    if left >= right {
        return; // Terminate recursion when subarray length is 1
    }

    // Divide and conquer stage
    let mid = left + (right - left) / 2; // Calculate midpoint
    merge_sort(nums, left, mid); // Recursively process the left subarray
    merge_sort(nums, mid + 1, right); // Recursively process the right subarray

    // Merge stage
    merge(nums, left, mid, right);
}

/* Driver Code */
fn main() {
    /* Merge sort */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("After merge sort, nums = {:?}", nums);
}
