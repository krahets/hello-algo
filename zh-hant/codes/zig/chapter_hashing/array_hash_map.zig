// File: array_hash_map.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 鍵值對
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

// 基於陣列實現的雜湊表
pub fn ArrayHashMap(comptime T: type) type {
    return struct {
        bucket: ?std.ArrayList(?T) = null,
        mem_allocator: std.mem.Allocator = undefined,

        const Self = @This();
        
        // 建構子
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            self.mem_allocator = allocator;
            // 初始化一個長度為 100 的桶（陣列）
            self.bucket = std.ArrayList(?T).init(self.mem_allocator);
            var i: i32 = 0;
            while (i < 100) : (i += 1) {
                try self.bucket.?.append(null);
            }
        }

        // 析構函式
        pub fn deinit(self: *Self) void {
            if (self.bucket != null) self.bucket.?.deinit();
        }

        // 雜湊函式
        fn hashFunc(key: usize) usize {
            var index = key % 100;
            return index;
        }

        // 查詢操作
        pub fn get(self: *Self, key: usize) []const u8 {
            var index = hashFunc(key);
            var pair = self.bucket.?.items[index];
            return pair.?.val;
        }

        // 新增操作
        pub fn put(self: *Self, key: usize, val: []const u8) !void {
            var pair = Pair.init(key, val);
            var index = hashFunc(key);
            self.bucket.?.items[index] = pair;
        }

        // 刪除操作
        pub fn remove(self: *Self, key: usize) !void {
            var index = hashFunc(key);
            // 置為 null ，代表刪除
            self.bucket.?.items[index] = null;
        }       

        // 獲取所有鍵值對
        pub fn pairSet(self: *Self) !std.ArrayList(T) {
            var entry_set = std.ArrayList(T).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try entry_set.append(item.?);
            }
            return entry_set;
        }  

        // 獲取所有鍵
        pub fn keySet(self: *Self) !std.ArrayList(usize) {
            var key_set = std.ArrayList(usize).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try key_set.append(item.?.key);
            }
            return key_set;
        }  

        // 獲取所有值
        pub fn valueSet(self: *Self) !std.ArrayList([]const u8) {
            var value_set = std.ArrayList([]const u8).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try value_set.append(item.?.val);
            }
            return value_set;
        }

        // 列印雜湊表
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
    // 初始化雜湊表
    var map = ArrayHashMap(Pair){};
    try map.init(std.heap.page_allocator);
    defer map.deinit();

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, value)
    try map.put(12836, "小哈");
    try map.put(15937, "小囉");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鴨");
    std.debug.print("\n新增完成後，雜湊表為\nKey -> Value\n", .{});
    try map.print();

    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 value
    var name = map.get(15937);
    std.debug.print("\n輸入學號 15937 ，查詢到姓名 {s}\n", .{name});

    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, value)
    try map.remove(10583);
    std.debug.print("\n刪除 10583 後，雜湊表為\nKey -> Value\n", .{});
    try map.print();
    
    // 走訪雜湊表
    std.debug.print("\n走訪鍵值對 Key->Value\n", .{});
    var entry_set = try map.pairSet();
    for (entry_set.items) |kv| {
        std.debug.print("{} -> {s}\n", .{kv.key, kv.val});
    }
    defer entry_set.deinit();
    std.debug.print("\n單獨走訪鍵 Key\n", .{});
    var key_set = try map.keySet();
    for (key_set.items) |key| {
        std.debug.print("{}\n", .{key});
    }
    defer key_set.deinit();
    std.debug.print("\n單獨走訪值 value\n", .{});
    var value_set = try map.valueSet();
    for (value_set.items) |val| {
        std.debug.print("{s}\n", .{val});
    }
    defer value_set.deinit();

    _ = try std.io.getStdIn().reader().readByte();
}