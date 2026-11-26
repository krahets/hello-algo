// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 再帰関数
fn recur(n: i32) i32 {
    // 終了条件
    if (n == 1) {
        return 1;
    }
    // 行き：再帰呼び出し
    const res = recur(n - 1);
    // 帰り：結果を返す
    return n + res;
}

// 反復で再帰を模擬
fn forLoopRecur(comptime n: i32) i32 {
    // 明示的なスタックでシステムの呼び出しスタックを模擬
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // 行き：再帰呼び出し
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // 帰り：結果を返す
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// 末尾再帰関数
fn tailRecur(n: i32, res: i32) i32 {
    // 終了条件
    if (n == 0) {
        return res;
    }
    // 末尾再帰呼び出し
    return tailRecur(n - 1, res + n);
}

// フィボナッチ数列
fn fib(n: i32) i32 {
    // 終了条件 f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    const res: i32 = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

// 実行例
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("再帰関数による総和 res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("反復で再帰を模擬して求めた総和 res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("末尾再帰関数による総和 res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("フィボナッチ数列の第 {} 項は {}\n", .{ n, fib(n) });

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "recursion" {
    run();
}
