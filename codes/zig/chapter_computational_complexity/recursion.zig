// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com)
 
const std = @import("std");

// 递归函数
fn recur(n: i32) i32 {
    // 终止条件
    if (n == 1) {
        return 1;
    }
    // 递：递归调用
    var res: i32 = recur(n - 1);
    // 归：返回结果
    return n + res;
}

// 使用迭代模拟递归
fn forLoopRecur(comptime n: i32) i32 {
    // 使用一个显式的栈来模拟系统调用栈
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // 递：递归调用
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // 归：返回结果
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// 尾递归函数
fn tailRecur(n: i32, res: i32) i32 {
    // 终止条件
    if (n == 0) {
        return res;
    }
    // 尾递归调用
    return tailRecur(n - 1, res + n);
}

// 斐波那契数列
fn fib(n: i32) i32 {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    var res: i32 = fib(n - 1) + fib(n - 2);
    // 返回结果 f(n)
    return res;
}

// Driver Code
pub fn main() !void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("\n递归函数的求和结果 res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("\n使用迭代模拟递归的求和结果 res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("\n尾递归函数的求和结果 res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("\n斐波那契数列的第 {} 项为 {}\n", .{n, fib(n)});
}
