// File: array_hash_map.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// キーと値の組
const Pair = struct {
    key: usize = undefined,
    val: []const u8 = undefined,

   pub fn init(key: usize, val: []const u8) Pair {
        return Pair {
            .key = key,
            .val = val,
        };
    }
};

// 配列ベースのハッシュテーブル
pub fn ArrayHashMap(comptime T: type) type {
    return struct {
        bucket: ?std.ArrayList(?T) = null,
        mem_allocator: std.mem.Allocator = undefined,

        const Self = @This();
        
        // コンストラクタ
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            self.mem_allocator = allocator;
            // 長さ 100 のバケット（配列）を初期化する
            self.bucket = std.ArrayList(?T).init(self.mem_allocator);
            var i: i32 = 0;
            while (i < 100) : (i += 1) {
                try self.bucket.?.append(null);
            }
        }

        // デストラクタ
        pub fn deinit(self: *Self) void {
            if (self.bucket != null) self.bucket.?.deinit();
        }

        // ハッシュ関数
        fn hashFunc(key: usize) usize {
            var index = key % 100;
            return index;
        }

        // 検索操作
        pub fn get(self: *Self, key: usize) []const u8 {
            var index = hashFunc(key);
            var pair = self.bucket.?.items[index];
            return pair.?.val;
        }

        // 追加操作
        pub fn put(self: *Self, key: usize, val: []const u8) !void {
            var pair = Pair.init(key, val);
            var index = hashFunc(key);
            self.bucket.?.items[index] = pair;
        }

        // 削除操作
        pub fn remove(self: *Self, key: usize) !void {
            var index = hashFunc(key);
            // null に設定し、削除を表す
            self.bucket.?.items[index] = null;
        }       

        // すべてのキーと値のペアを取得
        pub fn pairSet(self: *Self) !std.ArrayList(T) {
            var entry_set = std.ArrayList(T).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try entry_set.append(item.?);
            }
            return entry_set;
        }  

        // すべてのキーを取得
        pub fn keySet(self: *Self) !std.ArrayList(usize) {
            var key_set = std.ArrayList(usize).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try key_set.append(item.?.key);
            }
            return key_set;
        }  

        // すべての値を取得
        pub fn valueSet(self: *Self) !std.ArrayList([]const u8) {
            var value_set = std.ArrayList([]const u8).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try value_set.append(item.?.val);
            }
            return value_set;
        }

        // ハッシュテーブルを出力
        pub fn print(self: *Self) !void {
            var entry_set = try self.pairSet();
            defer entry_set.deinit();
            for (entry_set.items) |item| {
                std.debug.print("{} -> {s}\n", .{item.key, item.val});
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // ハッシュテーブルを初期化
    var map = ArrayHashMap(Pair){};
    try map.init(std.heap.page_allocator);
    defer map.deinit();

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, value) を追加する
    try map.put(12836, "シャオハー");
    try map.put(15937, "シャオルオ");
    try map.put(16750, "シャオスワン");
    try map.put(13276, "シャオファー");
    try map.put(10583, "シャオヤー");
    std.debug.print("\n追加完了後、ハッシュテーブルは\nKey -> Value\n", .{});
    try map.print();

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 value を取得する
    var name = map.get(15937);
    std.debug.print("\n学籍番号 15937 を入力すると、名前 {s} が見つかります\n", .{name});

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, value) を削除する
    try map.remove(10583);
    std.debug.print("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value\n", .{});
    try map.print();
    
    // ハッシュテーブルを走査
    std.debug.print("\nキーと値の組 Key->Value を順に表示\n", .{});
    var entry_set = try map.pairSet();
    for (entry_set.items) |kv| {
        std.debug.print("{} -> {s}\n", .{kv.key, kv.val});
    }
    defer entry_set.deinit();
    std.debug.print("\nキー Key のみを順に表示\n", .{});
    var key_set = try map.keySet();
    for (key_set.items) |key| {
        std.debug.print("{}\n", .{key});
    }
    defer key_set.deinit();
    std.debug.print("\n値 value のみを順に表示\n", .{});
    var value_set = try map.valueSet();
    for (value_set.items) |val| {
        std.debug.print("{s}\n", .{val});
    }
    defer value_set.deinit();

    _ = try std.io.getStdIn().reader().readByte();
}