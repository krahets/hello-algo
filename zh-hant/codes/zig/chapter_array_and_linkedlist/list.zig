// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 範例主程式
pub fn run() !void {
    // 初始化列表
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // 延後釋放記憶體

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("列表 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 存取元素
    const num = nums.items[1];
    std.debug.print("存取索引 1 處的元素，得到 num = {}\n", .{num});

    // 更新元素
    nums.items[1] = 0;
    std.debug.print("將索引 1 處的元素更新為 0，得到 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 清空列表
    nums.clearRetainingCapacity();
    std.debug.print("清空列表後，nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 在尾端加入元素
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("加入元素後，nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 在中間插入元素
    try nums.insert(3, 6);
    std.debug.print("在索引 3 處插入數字 6，得到 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 刪除元素
    _ = nums.orderedRemove(3);
    std.debug.print("刪除索引 3 處的元素，得到 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 依索引走訪列表
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // 直接走訪列表中的元素
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // 串接兩個列表
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("將列表 nums1 接在 nums 之後，得到 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 排序列表
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("列表排序後，nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
