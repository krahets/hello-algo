// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化串列
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("串列 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 訪問元素
    var num = nums.items[1];
    std.debug.print("\n訪問索引 1 處的元素，得到 num = {}", .{num});

    // 更新元素
    nums.items[1] = 0;
    std.debug.print("\n將索引 1 處的元素更新為 0 ，得到 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 清空串列
    nums.clearRetainingCapacity();
    std.debug.print("\n清空串列後 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 在尾部新增元素
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("\n新增元素後 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 在中間插入元素
    try nums.insert(3, 6);
    std.debug.print("\n在索引 3 處插入數字 6 ，得到 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 刪除元素
    _ = nums.orderedRemove(3);
    std.debug.print("\n刪除索引 3 處的元素，得到 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 透過索引走訪串列
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums[i];
    }
    // 直接走訪串列元素
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // 拼接兩個串列
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("\n將串列 nums1 拼接到 nums 之後，得到 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    // 排序串列
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("\n排序串列後 nums = ", .{});
    inc.PrintUtil.printList(i32, nums);

    _ = try std.io.getStdIn().reader().readByte();
}

