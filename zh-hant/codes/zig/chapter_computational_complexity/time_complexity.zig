// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 常數階
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

// 線性階
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 線性階（走訪陣列）
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // 迴圈次數與陣列長度成正比
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// 平方階
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // 迴圈次數正比於資料大小 n 的平方
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// 平方階（氣泡排序）
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // 計數器
    // 外層迴圈：未排序區間為 [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 交換元素需 3 個基本操作
            }
        }
    }
    return count;
}

// 指數階（迴圈實作）
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
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

// 指數階（遞迴實作）
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// 對數階（迴圈實作）
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var: i32 = n;
    while (n_var > 1) : (n_var = @divTrunc(n_var, 2)) {
        count += 1;
    }
    return count;
}

// 對數階（遞迴實作）
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(@divTrunc(n, 2)) + 1;
}

// 線性對數階
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(@divTrunc(n, 2)) + linearLogRecur(@divTrunc(n, 2));
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 階乘階（遞迴實作）
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // 1 個呼叫分為 n 個
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// 主程式
pub fn run() void {
    // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
    const n: i32 = 8;
    std.debug.print("輸入資料大小 n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("常數階的操作次數 = {}\n", .{count});

    count = linear(n);
    std.debug.print("線性階的操作次數 = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("線性階（走訪陣列）的操作次數 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("平方階的操作次數 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("平方階（氣泡排序）的操作次數 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("指數階（迴圈實作）的操作次數 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("指數階（遞迴實作）的操作次數 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("對數階（迴圈實作）的操作次數 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("對數階（遞迴實作）的操作次數 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("線性對數階（遞迴實作）的操作次數 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("階乘階（遞迴實作）的操作次數 = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
