// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com)
 
const std = @import("std");

// 遞迴函式
fn recur(n: i32) i32 {
    // 終止條件
    if (n == 1) {
        return 1;
    }
    // 遞：遞迴呼叫
    var res: i32 = recur(n - 1);
    // 迴：返回結果
    return n + res;
}

// 使用迭代模擬遞迴
fn forLoopRecur(comptime n: i32) i32 {
    // 使用一個顯式的堆疊來模擬系統呼叫堆疊
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // 遞：遞迴呼叫
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // 迴：返回結果
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// 尾遞迴函式
fn tailRecur(n: i32, res: i32) i32 {
    // 終止條件
    if (n == 0) {
        return res;
    }
    // 尾遞迴呼叫
    return tailRecur(n - 1, res + n);
}

// 費波那契數列
fn fib(n: i32) i32 {
    // 終止條件 f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    var res: i32 = fib(n - 1) + fib(n - 2);
    // 返回結果 f(n)
    return res;
}

// Driver Code
pub fn main() !void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("\n遞迴函式的求和結果 res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("\n使用迭代模擬遞迴的求和結果 res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("\n尾遞迴函式的求和結果 res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("\n費波那契數列的第 {} 項為 {}\n", .{n, fib(n)});
}
