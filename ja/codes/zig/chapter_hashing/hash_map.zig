// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // ハッシュテーブルを初期化
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // メモリの遅延解放
    defer map.deinit();

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, value) を追加する
    try map.put(12836, "シャオハー");
    try map.put(15937, "シャオルオ");
    try map.put(16750, "シャオスワン");
    try map.put(13276, "シャオファー");
    try map.put(10583, "シャオヤー");
    std.debug.print("\n追加完了後、ハッシュテーブルは\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 value を取得する
    var name = map.get(15937).?;
    std.debug.print("\n学籍番号 15937 を入力すると、名前 {s} が見つかります\n", .{name});

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, value) を削除する
    _ = map.remove(10583);
    std.debug.print("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // ハッシュテーブルを走査
    std.debug.print("\nキーと値の組 Key->Value を順に表示\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\nキー Key のみを順に表示\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\n値 value のみを順に表示\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

