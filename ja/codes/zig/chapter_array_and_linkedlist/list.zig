// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 実行用コード
pub fn run() !void {
    // リストを初期化する
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // メモリの解放を遅延させる

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("リスト nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 要素にアクセスする
    const num = nums.items[1];
    std.debug.print("インデックス 1 の要素にアクセスした結果 num = {}\n", .{num});

    // 要素を更新する
    nums.items[1] = 0;
    std.debug.print("インデックス 1 の要素を 0 に更新した結果 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // リストを空にする
    nums.clearRetainingCapacity();
    std.debug.print("リストを空にした後 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 末尾に要素を追加する
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("要素を追加した後 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 途中に要素を挿入する
    try nums.insert(3, 6);
    std.debug.print("インデックス 3 に数値 6 を挿入した結果 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 要素を削除する
    _ = nums.orderedRemove(3);
    std.debug.print("インデックス 3 の要素を削除した結果 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // インデックスを使ってリストを走査する
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // リストの要素を直接走査する
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // 2 つのリストを連結する
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("リスト nums の後ろに nums1 を連結した結果 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // リストをソートする
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("リストをソートした後 nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
