// File: TreeNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a binary tree node
// 编译期泛型
pub fn TreeNode(comptime T: type) type {
    return struct {
        const Self = @This();

        val: T = undefined,
        left: ?*Self = null,
        right: ?*Self = null,

        // Initialize a tree node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.left = null;
            self.right = null;
        }
    };   
}