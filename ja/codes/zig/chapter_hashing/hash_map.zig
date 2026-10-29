// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 実行用コード
pub fn main() !void {
    // ハッシュテーブルを初期化する
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // メモリの解放を遅延させる
    defer map.deinit();

    // 追加操作
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    try map.put(12836, "小哈");
    try map.put(15937, "小啰");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鸭");
    std.debug.print("\n追加後のハッシュテーブル\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 取得操作
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    var name = map.get(15937).?;
    std.debug.print("\n学生番号 15937 に対応する氏名は {s}\n", .{name});

    // 削除操作
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    _ = map.remove(10583);
    std.debug.print("\n10583 を削除した後のハッシュテーブル\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // ハッシュテーブルを走査する
    std.debug.print("\nキーと値のペア Key->Value を走査する\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\nキー Key だけを走査する\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\n値 value だけを走査する\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

