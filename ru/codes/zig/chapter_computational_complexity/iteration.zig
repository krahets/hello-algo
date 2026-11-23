// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// Цикл for
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // Циклическое суммирование 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// Цикл while
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 2, ..., n-1, n
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

// Цикл while (двойное обновление)
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Инициализация условной переменной
    // Циклическое суммирование 1, 4, 10, ...
    while (i <= n) : ({
        // Обновить условную переменную
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// Двойной цикл for
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // Цикл по i = 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        // Цикл по j = 1, 2, ..., n-1, n
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("Результат суммирования в цикле for res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("Результат суммирования в цикле while res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("Результат суммирования в цикле while (двойное обновление) res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("Результат обхода в двойном цикле for {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
