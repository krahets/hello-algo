// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// Цикл for
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// Цикл while
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Задать начальное значение переменной условия
    // Сложить числа 1, 2, ..., n-1, n в цикле
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  Цикл while с двумя обновлениями
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // Задать начальное значение переменной условия
    // Сложить числа 1, 4, 10, ... в цикле
    while (i <= n) : ({
        // Обновить переменную условия
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// Вложенные циклы for
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // Перебрать i = 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        // Перебрать j = 1, 2, ..., n-1, n
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// Основная программа
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("Сумма в цикле for: res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("Сумма в цикле while: res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("Сумма в цикле while с двумя обновлениями: res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("Результат обхода вложенными циклами for: {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
