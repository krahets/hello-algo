/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* Quick sort */
struct QuickSort;

impl QuickSort {
    /* Sentinel partition */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot to the boundary between the two subarrays
        i // Return the index of the pivot
    }

    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Terminate recursion when subarray length is 1
        if left >= right {
            return;
        }
        // Sentinel partition
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recursively process the left subarray and right subarray
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Quick sort (recursion depth optimization) */
struct QuickSortMedian;

impl QuickSortMedian {
    /* Select the median of three candidate elements */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m is between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l is between m and r
        }
        right
    }

    /* Sentinel partition (median of three) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Select the median of three candidate elements
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Swap the median to the array's leftmost position
        nums.swap(left, med);
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot to the boundary between the two subarrays
        i // Return the index of the pivot
    }

    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Terminate recursion when subarray length is 1
        if left >= right {
            return;
        }
        // Sentinel partition
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recursively process the left subarray and right subarray
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Quick sort (recursion depth optimization) */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* Sentinel partition */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Search from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Search from left to right for the first element greater than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot to the boundary between the two subarrays
        i // Return the index of the pivot
    }

    /* Quick sort (recursion depth optimization) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Terminate when subarray length is 1
        while left < right {
            // Sentinel partition operation
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Perform quick sort on the shorter of the two subarrays
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Recursively sort the left subarray
                left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Recursively sort the right subarray
                right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* Quick sort */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort, nums = {:?}", nums);

    /* Quick sort (recursion depth optimization) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort (median pivot optimization), nums = {:?}", nums);

    /* Quick sort (recursion depth optimization) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort (recursion depth optimization), nums = {:?}", nums);
}
