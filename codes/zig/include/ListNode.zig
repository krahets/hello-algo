// File: ListNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a singly-linked list node
// 编译期泛型
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = 0,
        next: ?*Self = null,

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
        }
    };
}