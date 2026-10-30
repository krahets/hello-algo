// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Get the k-th digit of num, where exp = 10^(k-1)
fn digit(num: i32, exp: i32) i32 {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return @mod(@divFloor(num, exp), 10);
}

// Counting sort (sort nums by the k-th digit)
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // Count the occurrences of each digit from 0 to 9
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // Get the kth digit of the current element and store it in d
        counter[d] += 1; // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i];       // Place the current element at index j
        counter[d] -= 1;        // Decrease the count for d by 1
        if (i == 0) break;
    }
    // Overwrite the original array nums with the result
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = res[i];
    }
}

// Radix sort
fn radixSort(nums: []i32) !void {
    // Get the largest array element to determine the maximum number of digits
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // Process digits from least significant to most significant
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        try countingSortDigit(nums, exp);    
    }
} 

// Driver code
pub fn main() !void {
    // Radix sort
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("After radix sort, nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}