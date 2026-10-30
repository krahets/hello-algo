// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Recursive function
fn recur(n: i32) i32 {
    // Base case
    if (n == 1) {
        return 1;
    }
    // Recurse: make a recursive call
    const res = recur(n - 1);
    // Unwind: return the result
    return n + res;
}

// Simulate recursion using iteration
fn forLoopRecur(comptime n: i32) i32 {
    // Use an explicit stack to simulate the system call stack
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // Simulate recursive descent by filling the explicit stack
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // Simulate unwinding by accumulating the stored values
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// Tail-recursive function
fn tailRecur(n: i32, res: i32) i32 {
    // Base case
    if (n == 0) {
        return res;
    }
    // Tail-recursive call
    return tailRecur(n - 1, res + n);
}

// Fibonacci sequence
fn fib(n: i32) i32 {
    // Base cases: f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    const res: i32 = fib(n - 1) + fib(n - 2);
    // Return the result f(n)
    return res;
}

// Driver code
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("Sum computed by recursion: res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("Sum computed by simulating recursion with iteration: res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("Sum computed by tail recursion: res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("Term {} of the Fibonacci sequence is {}\n", .{ n, fib(n) });

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "recursion" {
    run();
}
