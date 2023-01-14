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

// Generate a binary tree with an array
pub fn arrToTree(comptime T: type, mem_allocator: std.mem.Allocator, list: []T) !?*TreeNode(T) {
    if (list.len == 0) return null;
    var root = try mem_allocator.create(TreeNode(T));
    root.init(list[0]);
    var que = std.ArrayList(*TreeNode(T)).init(std.heap.page_allocator);
    try que.append(root); 
    var index: usize = 0;
    while (que.items.len > 0) {
        var node = que.orderedRemove(0);
        index += 1;
        if (index >= list.len) break;
        if (index < list.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(list[index]);
            node.left = tmp;
            try que.append(node.left.?);
        }
        index += 1;
        if (index >= list.len) break;
        if (index < list.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(list[index]);
            node.right = tmp;
            try que.append(node.right.?);
        }
    }
    return root;
}