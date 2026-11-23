/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* Merge the left and right subarrays */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // The left subarray spans [left, mid], and the right subarray spans [mid+1, right]
    // Create a temporary array tmp to store the merged result
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // Initialize the starting indices of the left and right subarrays
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // While both subarrays have elements remaining, compare them and copy the smaller element into the temporary array
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
    // Copy the elements of temporary array tmp back into the corresponding range of the original array nums
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* Merge sort */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // Base case
    if left >= right {
        return; // Stop recursing when the subarray has at most one element
    }

    // Divide phase
    let mid = left + (right - left) / 2; // Calculate the midpoint
    merge_sort(nums, left, mid); // Recurse on the left subarray
    merge_sort(nums, mid + 1, right); // Recurse on the right subarray

    // Merge phase
    merge(nums, left, mid, right);
}

/* Driver code */
fn main() {
    /* Merge sort */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("After merge sort, nums = {:?}", nums);
}
