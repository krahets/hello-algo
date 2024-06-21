// File: TreeNode.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 二叉树节点
pub fn TreeNode(comptime T: type) type {
    return struct {
        const Self = @This();

        val: T = undefined,         // 节点值
        height: i32 = undefined,    // 节点高度
        left: ?*Self = null,        // 左子节点指针
        right: ?*Self = null,       // 右子节点指针

        // Initialize a tree node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.height = 0;
            self.left = null;
            self.right = null;
        }
    };   
}

// 将数组反序列化为二叉树
pub fn arrToTree(comptime T: type, mem_allocator: std.mem.Allocator, arr: []T) !?*TreeNode(T) {
    if (arr.len == 0) return null;
    var root = try mem_allocator.create(TreeNode(T));
    root.init(arr[0]);
    const L = std.TailQueue(*TreeNode(T));
    var que = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    que.append(root_node); 
    var index: usize = 0;
    while (que.len > 0) {
        var que_node = que.popFirst().?;
        var node = que_node.data;
        index += 1;
        if (index >= arr.len) break;
        if (index < arr.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(arr[index]);
            node.left = tmp;
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            que.append(tmp_node);
        }
        index += 1;
        if (index >= arr.len) break;
        if (index < arr.len) {
            var tmp = try mem_allocator.create(TreeNode(T));
            tmp.init(arr[index]);
            node.right = tmp;
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            que.append(tmp_node);
        }
    }
    return root;
}