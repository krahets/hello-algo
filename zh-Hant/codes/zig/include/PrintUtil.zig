// File: PrintUtil.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
pub const ListUtil = @import("ListNode.zig");
pub const ListNode = ListUtil.ListNode;
pub const TreeUtil = @import("TreeNode.zig");
pub const TreeNode = TreeUtil.TreeNode;

// 列印陣列
pub fn printArray(comptime T: type, nums: []T) void {
    std.debug.print("[", .{});
    if (nums.len > 0) {
        for (nums, 0..) |num, j| {
            std.debug.print("{}{s}", .{num, if (j == nums.len-1) "]" else ", " });
        }
    } else {
        std.debug.print("]", .{});
    }
}

// 列印串列
pub fn printList(comptime T: type, list: std.ArrayList(T)) void {
    std.debug.print("[", .{});
    if (list.items.len > 0) {
        for (list.items, 0..) |value, i| {
            std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "]" else ", " });
        }
    } else {
        std.debug.print("]", .{});
    }
}

// 列印鏈結串列
pub fn printLinkedList(comptime T: type, node: ?*ListNode(T)) !void {
    if (node == null) return;
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    defer list.deinit();
    var head = node;
    while (head != null) {
        try list.append(head.?.val);
        head = head.?.next;
    }
    for (list.items, 0..) |value, i| {
        std.debug.print("{}{s}", .{value, if (i == list.items.len-1) "\n" else "->" });
    }
}

// 列印佇列
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

// 列印雜湊表
pub fn printHashMap(comptime TKey: type, comptime TValue: type, map: std.AutoHashMap(TKey, TValue)) void {
    var it = map.iterator();
    while (it.next()) |kv| {
        var key = kv.key_ptr.*;
        var value = kv.value_ptr.*;
        std.debug.print("{} -> {s}\n", .{key, value});
    }
}

// 列印堆積
pub fn printHeap(comptime T: type, mem_allocator: std.mem.Allocator, queue: anytype) !void {
    var arr = queue.items;
    var len = queue.len;
    std.debug.print("堆積的陣列表示：", .{});
    printArray(T, arr[0..len]);
    std.debug.print("\n堆積的樹狀表示：\n", .{});
    var root = try TreeUtil.arrToTree(T, mem_allocator, arr[0..len]);
    try printTree(root, null, false);
}

// 列印二元樹
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

pub fn showTrunks(p: ?*Trunk) void {
    if (p == null) return;
    showTrunks(p.?.prev);
    std.debug.print("{s}", .{p.?.str});
}

// 列印二元樹
pub fn printTree(root: ?*TreeNode(i32), prev: ?*Trunk, isRight: bool) !void {
    if (root == null) {
        return;
    }

    var prev_str = "    ";
    var trunk = Trunk{.prev = prev, .str = prev_str};

    try printTree(root.?.right, &trunk, true);
   
    if (prev == null) {
        trunk.str = "———";
    } else if (isRight) {
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