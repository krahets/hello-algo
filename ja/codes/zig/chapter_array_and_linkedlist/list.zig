// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Driver Code
pub fn run() !void {
    // リストを初期化
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // メモリの遅延解放

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("リスト nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 要素にアクセス
    const num = nums.items[1];
    std.debug.print("インデックス 1 の要素にアクセスすると、num = {}\n", .{num});

    // 要素を更新
    nums.items[1] = 0;
    std.debug.print("インデックス 1 の要素を 0 に更新すると、nums = {}\n", .{utils.fmt.slice(nums.items)});

    // リストを空にする
    nums.clearRetainingCapacity();
    std.debug.print("リストを空にした後 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 末尾に要素を追加
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("要素を追加すると nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 中間に要素を挿入
    try nums.insert(3, 6);
    std.debug.print("インデックス 3 に数値 6 を挿入すると、nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 要素を削除
    _ = nums.orderedRemove(3);
    std.debug.print("インデックス 3 の要素を削除すると、nums = {}\n", .{utils.fmt.slice(nums.items)});

    // インデックスでリストを走査
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // リスト要素を直接走査
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // 2 つのリストを連結する
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("リスト nums1 を nums の後ろに連結すると、nums = {}\n", .{utils.fmt.slice(nums.items)});

    // リストをソート
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("リストをソートすると nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
