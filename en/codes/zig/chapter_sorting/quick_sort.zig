// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Quick sort implementation
const QuickSort = struct {

    // Swap the elements
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Two-pointer partitioning
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Use nums[left] as the pivot
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Scan from right to left for the first element smaller than the pivot
            while (i < j and nums[i] <= nums[left]) i += 1; // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j);   // Swap these two elements
        }
        swap(nums, i, left);    // Swap the pivot into the boundary position between the two subarrays
        return i;               // Return the pivot index
    }

    // Quick sort
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // Stop when the current subarray has at most one element
        if (left >= right) return;
        // Two-pointer partitioning
        var pivot = partition(nums, left, right);
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// Quick sort implementation (median-of-three pivot optimization)
const QuickSortMedian = struct {

    // Swap the elements
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Select the median of three candidate elements
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m lies between l and r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l lies between m and r
        return right;
    }

    // Two-pointer partitioning (median of three)
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Select the median of three candidate elements
        var med = medianThree(nums, left, (left + right) / 2, right);
        // Swap the median into the leftmost position of the current subarray
        swap(nums, left, med);
        // Use nums[left] as the pivot
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Scan from right to left for the first element smaller than the pivot
            while (i < j and nums[i] <= nums[left]) i += 1; // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j);   // Swap these two elements
        }
        swap(nums, i, left);    // Swap the pivot into the boundary position between the two subarrays
        return i;               // Return the pivot index
    }

    // Quick sort
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // Stop when the current subarray has at most one element
        if (left >= right) return;
        // Two-pointer partitioning
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // Recurse on the left and right subarrays
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// Quick sort implementation (recursion-depth optimization)
const QuickSortTailCall = struct {

    // Swap the elements
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Two-pointer partitioning
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Use nums[left] as the pivot
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Scan from right to left for the first element smaller than the pivot
            while (i < j and nums[i] <= nums[left]) i += 1; // Scan from left to right for the first element larger than the pivot
            swap(nums, i, j);   // Swap these two elements
        }
        swap(nums, i, left);    // Swap the pivot into the boundary position between the two subarrays
        return i;               // Return the pivot index
    }

    // Quick sort (recursion depth optimization)
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // Stop when the current subarray has at most one element
        while (left < right) {
            // Perform two-pointer partitioning
            var pivot = partition(nums, left, right);
            // Apply quick sort to the shorter of the two subarrays
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // Recursively sort the left subarray
                left = pivot + 1;                   // The remaining unsorted range is [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // Recursively sort the right subarray
                right = pivot - 1;                  // The remaining unsorted range is [left, pivot - 1]
            }
        }
    }
};

// Driver code
pub fn main() !void {
    // Quick sort
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("After quick sort, nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // Quick sort (median pivot optimization)
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\nAfter quick sort (median-of-three pivot optimization), nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // Quick sort (recursion depth optimization)
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\nAfter quick sort (recursion-depth optimization), nums2 = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}