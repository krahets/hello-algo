// File: array_hash_map.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Key-value pair
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

// Hash table implemented with an array
pub fn ArrayHashMap(comptime T: type) type {
    return struct {
        bucket: ?std.ArrayList(?T) = null,
        mem_allocator: std.mem.Allocator = undefined,

        const Self = @This();
        
        // Initialize the hash map
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            self.mem_allocator = allocator;
            // Initialize the bucket array with 100 slots
            self.bucket = std.ArrayList(?T).init(self.mem_allocator);
            var i: i32 = 0;
            while (i < 100) : (i += 1) {
                try self.bucket.?.append(null);
            }
        }

        // Deinitialize the hash map
        pub fn deinit(self: *Self) void {
            if (self.bucket != null) self.bucket.?.deinit();
        }

        // Hash function
        fn hashFunc(key: usize) usize {
            var index = key % 100;
            return index;
        }

        // Lookup operation
        pub fn get(self: *Self, key: usize) []const u8 {
            var index = hashFunc(key);
            var pair = self.bucket.?.items[index];
            return pair.?.val;
        }

        // Insert operation
        pub fn put(self: *Self, key: usize, val: []const u8) !void {
            var pair = Pair.init(key, val);
            var index = hashFunc(key);
            self.bucket.?.items[index] = pair;
        }

        // Remove operation
        pub fn remove(self: *Self, key: usize) !void {
            var index = hashFunc(key);
            // Set the slot to null to mark it as removed
            self.bucket.?.items[index] = null;
        }       

        // Get all key-value pairs
        pub fn pairSet(self: *Self) !std.ArrayList(T) {
            var entry_set = std.ArrayList(T).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try entry_set.append(item.?);
            }
            return entry_set;
        }  

        // Get all keys
        pub fn keySet(self: *Self) !std.ArrayList(usize) {
            var key_set = std.ArrayList(usize).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try key_set.append(item.?.key);
            }
            return key_set;
        }  

        // Get all values
        pub fn valueSet(self: *Self) !std.ArrayList([]const u8) {
            var value_set = std.ArrayList([]const u8).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try value_set.append(item.?.val);
            }
            return value_set;
        }

        // Print the hash table
        pub fn print(self: *Self) !void {
            var entry_set = try self.pairSet();
            defer entry_set.deinit();
            for (entry_set.items) |item| {
                std.debug.print("{} -> {s}\n", .{item.key, item.val});
            }
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the hash table
    var map = ArrayHashMap(Pair){};
    try map.init(std.heap.page_allocator);
    defer map.deinit();

    // Insert operation
    // Insert the key-value pair (key, value) into the hash table
    try map.put(12836, "小哈");
    try map.put(15937, "小啰");
    try map.put(16750, "小算");
    try map.put(13276, "小法");
    try map.put(10583, "小鸭");
    std.debug.print("\nHash table after insertion:\nKey -> Value\n", .{});
    try map.print();

    // Lookup operation
    // Look up key in the hash table to obtain value
    var name = map.get(15937);
    std.debug.print("\nLook up student ID 15937: name = {s}\n", .{name});

    // Remove operation
    // Remove the key-value pair (key, value) from the hash table
    try map.remove(10583);
    std.debug.print("\nHash table after removing 10583:\nKey -> Value\n", .{});
    try map.print();
    
    // Traverse the hash table
    std.debug.print("\nIterate over key-value pairs, Key->Value\n", .{});
    var entry_set = try map.pairSet();
    for (entry_set.items) |kv| {
        std.debug.print("{} -> {s}\n", .{kv.key, kv.val});
    }
    defer entry_set.deinit();
    std.debug.print("\nIterate over keys only, Key\n", .{});
    var key_set = try map.keySet();
    for (key_set.items) |key| {
        std.debug.print("{}\n", .{key});
    }
    defer key_set.deinit();
    std.debug.print("\nIterate over the values only\n", .{});
    var value_set = try map.valueSet();
    for (value_set.items) |val| {
        std.debug.print("{s}\n", .{val});
    }
    defer value_set.deinit();

    _ = try std.io.getStdIn().reader().readByte();
}