// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Access an element at a random index
pub fn randomAccess(nums: []const i32) i32 {
    // Choose a random integer in the interval [0, nums.len)
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // Get and return the randomly selected element
    const randomNum = nums[random_index];
    return randomNum;
}

// Extend the array length
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // Initialize an array with the extended length
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // Copy all elements from the original array to the new array
    std.mem.copyForwards(i32, res, nums);

    // Return the new, extended array
    return res;
}

// Insert element num at index `index` in the array
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // Shift all elements at and after index `index` one position to the right
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // Assign num to the element at index `index`
    nums[index] = num;
}

// Remove the element at index `index`
pub fn remove(nums: []i32, index: usize) void {
    // Shift all elements after index `index` one position to the left
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// Traverse the array
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // Traverse the array by index
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // Iterate directly over the array elements
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // Iterate over both the indices and the elements
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// Find a specified element in the array
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Driver code
pub fn run() !void {
    // Initialize the array
    const arr = [_]i32{0} ** 5;
    std.debug.print("Array arr = {}\n", .{utils.fmt.slice(&arr)});

    // Array slice
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // Use the runtime variable known_at_runtime_zero to obtain a slice from the array pointer
    std.debug.print("Array nums = {}\n", .{utils.fmt.slice(nums)});

    // Random access
    const randomNum = randomAccess(nums);
    std.debug.print("Random element from nums: {}\n", .{randomNum});

    // Initialize the allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // Extend the length
    nums = try extend(allocator, nums, 3);
    std.debug.print("Extend the array length to 8: nums = {}\n", .{utils.fmt.slice(nums)});

    // Insert an element
    insert(nums, 6, 3);
    std.debug.print("Insert 6 at index 3: nums = {}\n", .{utils.fmt.slice(nums)});

    // Remove an element
    remove(nums, 2);
    std.debug.print("Remove the element at index 2: nums = {}\n", .{utils.fmt.slice(nums)});

    // Traverse the array
    traverse(nums);

    // Find an element
    const index = find(nums, 3);
    std.debug.print("Find 3 in nums: index = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
