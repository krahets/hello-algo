// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 定数オーダー
fn constant(n: i32) i32 {
    _ = n;
    var count: i32 = 0;
    const size: i32 = 100_000;
    var i: i32 = 0;
    while (i < size) : (i += 1) {
        count += 1;
    }
    return count;
}

// 線形オーダー
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 線形オーダー（配列の走査）
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // 反復回数は配列の長さに比例
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// 二次オーダー
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // 反復回数はデータサイズ n の二乗に比例
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// 二次オーダー（バブルソート）
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // カウンタ
    // 外側のループ：未整列区間は [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 内側のループ：未整列区間 [0, i] の最大要素を、交換しながら区間の右端へ移す
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 要素の交換は 3 回の基本操作からなる
            }
        }
    }
    return count;
}

// 指数オーダー（ループによる実装）
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // 各回で細胞が二分し、分裂する細胞の数は 1, 2, 4, 8, ..., 2^(n-1) となる
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < bas) : (j += 1) {
            count += 1;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

// 指数オーダー（再帰による実装）
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// 対数オーダー（ループによる実装）
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var: i32 = n;
    while (n_var > 1) : (n_var = @divTrunc(n_var, 2)) {
        count += 1;
    }
    return count;
}

// 対数オーダー（再帰による実装）
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(@divTrunc(n, 2)) + 1;
}

// 線形対数オーダー
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(@divTrunc(n, 2)) + linearLogRecur(@divTrunc(n, 2));
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 階乗オーダー（再帰による実装）
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // 1 個から n 個に分かれる
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// 実行例
pub fn run() void {
    // n を変えて実行し、計算量ごとに操作回数の増え方を確かめる
    const n: i32 = 8;
    std.debug.print("入力データのサイズ n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("定数オーダーの操作回数 = {}\n", .{count});

    count = linear(n);
    std.debug.print("線形オーダーの操作回数 = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("線形オーダー（配列の走査）の操作回数 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("二次オーダーの操作回数 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("二次オーダー（バブルソート）の操作回数 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("指数オーダー（ループによる実装）の操作回数 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("指数オーダー（再帰による実装）の操作回数 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("対数オーダー（ループによる実装）の操作回数 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("対数オーダー（再帰による実装）の操作回数 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("線形対数オーダー（再帰による実装）の操作回数 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("階乗オーダー（再帰による実装）の操作回数 = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
