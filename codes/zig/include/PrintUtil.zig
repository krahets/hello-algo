// File: PrintUtil.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
pub const ListUtil = @import("ListNode.zig");
pub const ListNode = ListUtil.ListNode;
pub const TreeUtil = @import("TreeNode.zig");
pub const TreeNode = TreeUtil.TreeNode;

// Print an array
pub fn printArray(comptime T: type, nums: []T) void {
    std.debug.print("[", .{});
    if (nums.len > 0) {
        for (nums) |num, j| {
            std.debug.print("{}{s}", .{num, if (j == nums.len-1) "]" else ", " });
        }
    } else {
        std.debug.print("]", .{});
    }
}

// Print a list
pub fn printList(comptime T: type, list: std.ArrayList(T)) void {
    std.debug.print("[", .{});
    if (list.items.len > 0) {
        for (list.items) |value, i| {
            std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "]" else ", " });
        }
    } else {
        std.debug.print("]", .{});
    }
    
}

// Print a linked list
pub fn printLinkedList(comptime T: type, node: ?*ListNode(T)) !void {
    if (node == null) return;
    var list = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list.deinit();
    var head = node;
    while (head != null) {
        try list.append(head.?.val);
        head = head.?.next;
    }
    for (list.items) |value, i| {
        std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "\n" else "->" });
    }
}

// Print a queue or deque
pub fn printQueue(comptime T: type, queue: std.TailQueue(T)) void {
    var node = queue.first;
    std.debug.print("[", .{});
    var i: i32 = 0;
    while (node != null) : (i += 1) {
        var data = node.?.data;
        std.debug.print("{}{s}", .{data, if (i == queue.len - 1) "]" else ", " });
        node = node.?.next;
    }
}

// Print a hash map
pub fn printHashMap(comptime TKey: type, comptime TValue: type, map: std.AutoHashMap(TKey, TValue)) void {
    var it = map.iterator();
    while (it.next()) |kv| {
        var key = kv.key_ptr.*;
        var value = kv.value_ptr.*;
        std.debug.print("{} -> {s}\n", .{key, value});
    }
}

// print a heap (PriorityQueue)
pub fn printHeap(comptime T: type, mem_allocator: std.mem.Allocator, queue: anytype) !void {
    var arr = queue.items;
    var len = queue.len;
    std.debug.print("堆的数组表示：", .{});
    printArray(T, arr[0..len]);
    std.debug.print("\n堆的树状表示：\n", .{});
    var root = try TreeUtil.arrToTree(T, mem_allocator, arr[0..len]);
    try printTree(root, null, false);
}

// This tree printer is borrowed from TECHIE DELIGHT
// https://www.techiedelight.com/c-program-print-binary-tree/
const Trunk = struct {
    prev: ?*Trunk = null,
    str: []const u8 = undefined,
    
    pub fn init(self: *Trunk, prev: ?*Trunk, str: []const u8) void {
        self.prev = prev;
        self.str = str;
    }
};

// Helper function to print branches of the binary tree
pub fn showTrunks(p: ?*Trunk) void {
    if (p == null) return;
    showTrunks(p.?.prev);
    std.debug.print("{s}", .{p.?.str});
}

// The interface of the tree printer
// Print a binary tree
pub fn printTree(root: ?*TreeNode(i32), prev: ?*Trunk, isLeft: bool) !void {
    if (root == null) {
        return;
    }

    var prev_str = "    ";
    var trunk = Trunk{.prev = prev, .str = prev_str};

    try printTree(root.?.right, &trunk, true);
   
    if (prev == null) {
        trunk.str = "———";
    } else if (isLeft) {
        trunk.str = "/———";
        prev_str = "   |";
    } else {
        trunk.str = "\\———";
        prev.?.str = prev_str;
    }

    showTrunks(&trunk);
    std.debug.print(" {}\n", .{root.?.val});

    if (prev) |_| {
        prev.?.str = prev_str;
    }
    trunk.str = "   |";

    try printTree(root.?.left, &trunk, false);
}