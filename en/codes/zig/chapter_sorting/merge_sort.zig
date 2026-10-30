// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Merge the left and right subarrays
// Left subarray range: [left, mid]
// Right subarray range: [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // Initialize the auxiliary array
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // Start and end indices of the left subarray in tmp
    var leftStart = left - left;
    var leftEnd = mid - left;
    // Start and end indices of the right subarray in tmp
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i and j point to the first elements of the left and right subarrays, respectively
    var i = leftStart;
    var j = rightStart;
    // Merge the left and right subarrays by overwriting the original array nums
    var k = left;
    while (k <= right) : (k += 1) {
        // If the left subarray has been exhausted, take an element from the right subarray and increment j
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // Otherwise, if the right subarray is exhausted or the left element is no greater than the right element, take the left element and increment i
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // Otherwise, both subarrays still have elements and the left element is larger, so take the right element and increment j
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// Merge sort
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // Base case
    if (left >= right) return;              // Stop recursing when the subarray has at most one element
    // Divide phase
    var mid = left + (right - left) / 2;    // Calculate the midpoint
    try mergeSort(nums, left, mid);         // Recurse on the left subarray
    try mergeSort(nums, mid + 1, right);    // Recurse on the right subarray
    // Merge phase
    try merge(nums, left, mid, right);
}

// Driver code
pub fn main() !void {
    // Merge sort
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("After merge sort, nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
