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
    // 再帰：再帰呼び出し
    const res = recur(n - 1);
    // 帰りがけ：結果を返す
    return n + res;
}

// 反復で再帰を模擬する
fn forLoopRecur(comptime n: i32) i32 {
    // 明示的なスタックを使ってシステムコールスタックを模擬する
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // 再帰：再帰呼び出し
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // 帰りがけ：結果を返す
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
    // f(n) = f(n-1) + f(n-2) を再帰的に呼び出す
    const res: i32 = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

// Driver Code
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("再帰関数の合計結果 res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("反復で再帰をシミュレートした合計結果 res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("末尾再帰関数の合計結果 res = {}\n", .{tailRecur(n, 0)});

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
