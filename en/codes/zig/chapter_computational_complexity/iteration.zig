// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for loop
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // Sum 1, 2, ..., n-1, n in a loop
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// while loop
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Initialize the loop control variable
    // Sum 1, 2, ..., n-1, n in a loop
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  while loop (two updates)
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Initialize the loop control variable
    // Sum 1, 4, 10, ... in a loop
    while (i <= n) : ({
        // Update the loop control variable
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// Nested for loops
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // Loop over i = 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        // Loop over j = 1, 2, ..., n-1, n
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// Driver code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("Sum computed by the for loop: res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("Sum computed by the while loop: res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("Sum computed by the while loop with two updates: res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("Nested for-loop traversal: {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
