// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Binary search (closed interval)
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // Loop until the search interval is empty (when i > j)
    while (i <= j) {
        var m = i + (j - i) / 2;                // Calculate the midpoint index m
        if (nums.items[m] < target) {           // In this case, target must be in [m+1, j] if it exists
            i = m + 1;
        } else if (nums.items[m] > target) {    // In this case, target must be in [i, m-1] if it exists
            j = m - 1;
        } else {                                // The target element was found; return its index
            return @intCast(m);
        }
    }
    // The target element was not found; return -1
    return -1;
}

// Binary search (left-closed, right-open interval)
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    var i: usize = 0;
    var j: usize = nums.items.len;
    // Search the half-open interval; it is empty when i = j
    while (i <= j) {
        var m = i + (j - i) / 2;                // Calculate the midpoint index m
        if (nums.items[m] < target) {           // In this case, target must be in [m+1, j) if it exists
            i = m + 1;
        } else if (nums.items[m] > target) {    // In this case, target must be in [i, m) if it exists
            j = m;
        } else {                                // The target element was found; return its index
            return @intCast(m);
        }
    }
    // The target element was not found; return -1
    return -1;
}

// Driver code
pub fn main() !void {
    var target: i32 = 6;
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 });

    // Binary search (closed interval)
    var index = binarySearch(i32, nums, target);
    std.debug.print("Index of target element 6 = {}\n", .{index});

    // Binary search (left-closed, right-open interval)
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("Index of target element 6 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}