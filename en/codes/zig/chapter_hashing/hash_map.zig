// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver code
pub fn main() !void {
    // Initialize the hash table
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // Defer releasing the memory
    defer map.deinit();

    // Insert operation
    // Insert the key-value pair (key, value) into the hash table
    try map.put(12836, "小哈");
    try map.put(15937, "小啰");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鸭");
    std.debug.print("\nHash table after insertion:\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // Lookup operation
    // Look up key in the hash table to obtain value
    var name = map.get(15937).?;
    std.debug.print("\nLook up student ID 15937: name = {s}\n", .{name});

    // Remove operation
    // Remove the key-value pair (key, value) from the hash table
    _ = map.remove(10583);
    std.debug.print("\nHash table after removing 10583:\nKey -> Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // Traverse the hash table
    std.debug.print("\nIterate over key-value pairs, Key->Value\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\nIterate over keys only, Key\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\nIterate over the values only\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

