// File: PrintUtil.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
pub const ListUtil = @import("ListNode.zig");
pub const ListNode = ListUtil.ListNode;
pub const TreeUtil = @import("TreeNode.zig");
pub const TreeNode = TreeUtil.TreeNode;

// キューを出力する
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

// ハッシュテーブルを出力
pub fn printHashMap(comptime TKey: type, comptime TValue: type, map: std.AutoHashMap(TKey, TValue)) void {
    var it = map.iterator();
    while (it.next()) |kv| {
        var key = kv.key_ptr.*;
        var value = kv.value_ptr.*;
        std.debug.print("{} -> {s}\n", .{ key, value });
    }
}

// ヒープを出力
pub fn printHeap(comptime T: type, mem_allocator: std.mem.Allocator, queue: anytype) !void {
    var arr = queue.items;
    var len = queue.len;
    std.debug.print("ヒープの配列表現：", .{});
    printArray(T, arr[0..len]);
    std.debug.print("\nヒープの木構造表現：\n", .{});
    var root = try TreeUtil.arrToTree(T, mem_allocator, arr[0..len]);
    try printTree(root, null, false);
}
