// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化雜湊表
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer map.deinit();

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, value)
    try map.put(12836, "小哈");
    try map.put(15937, "小囉");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鴨");
    std.debug.print("\n新增完成後，雜湊表為\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 value
    var name = map.get(15937).?;
    std.debug.print("\n輸入學號 15937 ，查詢到姓名 {s}\n", .{name});

    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, value)
    _ = map.remove(10583);
    std.debug.print("\n刪除 10583 後，雜湊表為\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 走訪雜湊表
    std.debug.print("\n走訪鍵值對 Key->Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\n單獨走訪鍵 Key\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\n單獨走訪值 value\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

