// File: TreeNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Print an Array
pub fn printArray(comptime T: type, nums: []T) void {
    std.debug.print("[", .{});
    for (nums) |num, j| {
        std.debug.print("{}{s}", .{num, if (j == nums.len-1) "]\n" else ", " });
     }
}
