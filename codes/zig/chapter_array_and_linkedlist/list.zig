// File: list.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化列表
    var list = std.ArrayList(i32).init(std.heap.page_allocator);
    // 延迟释放内存
    defer list.deinit();
    try list.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("列表 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 访问元素
    var num = list.items[1];
    std.debug.print("\n访问索引 1 处的元素，得到 num = {}", .{num});

    // 更新元素
    list.items[1] = 0;
    std.debug.print("\n将索引 1 处的元素更新为 0 ，得到 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 清空列表
    list.clearRetainingCapacity();
    std.debug.print("\n清空列表后 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 尾部添加元素
    try list.append(1);
    try list.append(3);
    try list.append(2);
    try list.append(5);
    try list.append(4);
    std.debug.print("\n添加元素后 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 中间插入元素
    try list.insert(3, 6);
    std.debug.print("\n在索引 3 处插入数字 6 ，得到 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 删除元素
    _ = list.orderedRemove(3);
    std.debug.print("\n删除索引 3 处的元素，得到 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 通过索引遍历列表
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < list.items.len) : (i += 1) {
        count += 1;
    }

    // 直接遍历列表元素
    count = 0;
    for (list.items) |_| {
        count += 1;
    }

    // 拼接两个列表
    var list1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer list1.deinit();
    try list1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try list.insertSlice(list.items.len, list1.items);
    std.debug.print("\n将列表 list1 拼接到 list 之后，得到 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 排序列表
    std.sort.sort(i32, list.items, {}, comptime std.sort.asc(i32));
    std.debug.print("\n排序列表后 list = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}

