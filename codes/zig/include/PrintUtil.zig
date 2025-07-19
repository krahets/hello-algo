// File: PrintUtil.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
pub const ListUtil = @import("ListNode.zig");
pub const ListNode = ListUtil.ListNode;
pub const TreeUtil = @import("TreeNode.zig");
pub const TreeNode = TreeUtil.TreeNode;

// 打印队列
pub fn printQueue(comptime T: type, queue: std.TailQueue(T)) void {
    var node = queue.first;
    std.debug.print("[", .{});
    var i: i32 = 0;
    while (node != null) : (i += 1) {
        var data = node.?.data;
        std.debug.print("{}{s}", .{ data, if (i == queue.len - 1) "]" else ", " });
        node = node.?.next;
    }
}

// 打印哈希表
pub fn printHashMap(comptime TKey: type, comptime TValue: type, map: std.AutoHashMap(TKey, TValue)) void {
    var it = map.iterator();
    while (it.next()) |kv| {
        var key = kv.key_ptr.*;
        var value = kv.value_ptr.*;
        std.debug.print("{} -> {s}\n", .{ key, value });
    }
}

// 打印堆
pub fn printHeap(comptime T: type, mem_allocator: std.mem.Allocator, queue: anytype) !void {
    var arr = queue.items;
    var len = queue.len;
    std.debug.print("堆的数组表示：", .{});
    printArray(T, arr[0..len]);
    std.debug.print("\n堆的树状表示：\n", .{});
    var root = try TreeUtil.arrToTree(T, mem_allocator, arr[0..len]);
    try printTree(root, null, false);
}

// 打印二叉树
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

// 打印二叉树
pub fn printTree(root: ?*TreeNode(i32), prev: ?*Trunk, isRight: bool) !void {
    if (root == null) {
        return;
    }

    var prev_str = "    ";
    var trunk = Trunk{ .prev = prev, .str = prev_str };

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
