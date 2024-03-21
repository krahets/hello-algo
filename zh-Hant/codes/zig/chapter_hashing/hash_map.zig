// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化哈希表
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // 延迟释放内存
    defer map.deinit();

    // 添加操作
    // 在哈希表中添加键值对 (key, value)
    try map.put(12836, "小哈");
    try map.put(15937, "小啰");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鸭");
    std.debug.print("\n添加完成后，哈希表为\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 查询操作
    // 向哈希表中输入键 key ，得到值 value
    var name = map.get(15937).?;
    std.debug.print("\n输入学号 15937 ，查询到姓名 {s}\n", .{name});

    // 删除操作
    // 在哈希表中删除键值对 (key, value)
    _ = map.remove(10583);
    std.debug.print("\n删除 10583 后，哈希表为\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 遍历哈希表
    std.debug.print("\n遍历键值对 Key->Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\n单独遍历键 Key\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\n单独遍历值 value\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

