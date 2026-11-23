/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* Quick sort */
struct QuickSort;

impl QuickSort {
    /* Two-pointer partitioning */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot into the boundary position between the two subarrays
        i // Return the pivot index
    }

    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Stop recursing when the subarray has at most one element
        if left >= right {
            return;
        }
        // Two-pointer partitioning
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recurse on the left and right subarrays
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Quick sort (median pivot optimization) */
struct QuickSortMedian;

impl QuickSortMedian {
    /* Select the median of three candidate elements */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m lies between l and r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l lies between m and r
        }
        right
    }

    /* Two-pointer partitioning (median of three) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Select the median of three candidate elements
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        nums.swap(left, med);
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot into the boundary position between the two subarrays
        i // Return the pivot index
    }

    /* Quick sort */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Stop recursing when the subarray has at most one element
        if left >= right {
            return;
        }
        // Two-pointer partitioning
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Recurse on the left and right subarrays
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Quick sort (recursion depth optimization) */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* Two-pointer partitioning */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Use nums[left] as the pivot
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Scan from right to left for the first element smaller than the pivot
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Scan from left to right for the first element larger than the pivot
            }
            nums.swap(i, j); // Swap these two elements
        }
        nums.swap(i, left); // Swap the pivot into the boundary position between the two subarrays
        i // Return the pivot index
    }

    /* Quick sort (recursion depth optimization) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Stop when the subarray has at most one element
        while left < right {
            // Perform two-pointer partitioning
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Apply quick sort to the shorter of the two subarrays
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Recursively sort the left subarray
                left = pivot + 1; // The remaining unsorted range is [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Recursively sort the right subarray
                right = pivot - 1; // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
}

/* Driver code */
fn main() {
    /* Quick sort */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort, nums = {:?}", nums);

    /* Quick sort (median pivot optimization) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort with median-of-three pivot selection, nums = {:?}", nums);

    /* Quick sort (recursion depth optimization) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("After quick sort with recursion depth optimization, nums = {:?}", nums);
}
