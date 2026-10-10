// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// ハッシュ探索（配列）
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // ハッシュテーブルの key: 目標要素、value: インデックス
    // ハッシュテーブルにこの key がなければ -1 を返す
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// ハッシュ探索（連結リスト）
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // ハッシュテーブルの key: 目標ノード値、value: ノードオブジェクト
    // ハッシュテーブルにこの key がなければ null を返す
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // ハッシュ探索（配列）
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // ハッシュテーブルを初期化
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: 要素、value: インデックス
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("対象要素 3 のインデックス = {}\n", .{index});

    // ハッシュ探索（連結リスト）
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // ハッシュテーブルを初期化
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("対象ノード値 3 に対応するノードオブジェクトは ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

