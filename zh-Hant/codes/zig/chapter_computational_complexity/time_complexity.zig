// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 常數階
fn constant(n: i32) i32 {
    _ = n;
    var count: i32 = 0;
    const size: i32 = 100_000;
    var i: i32 = 0;
    while(i<size) : (i += 1) {
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
    // 迴圈次數與資料大小 n 成平方關係
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// 平方階（泡沫排序）
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0;  // 計數器 
    // 外迴圈：未排序區間為 [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3;  // 元素交換包含 3 個單元操作
            }
        }
    }
    return count;
}

// 指數階（迴圈實現）
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

// 指數階（遞迴實現）
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// 對數階（迴圈實現）
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var = n;
    while (n_var > 1)
    {
        n_var = n_var / 2;
        count +=1;
    }
    return count;
}

// 對數階（遞迴實現）
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

// 線性對數階
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 階乘階（遞迴實現）
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // 從 1 個分裂出 n 個
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// Driver Code
pub fn main() !void {
    // 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
    const n: i32 = 8;
    std.debug.print("輸入資料大小 n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("常數階的操作數量 = {}\n", .{count});

    count = linear(n);
    std.debug.print("線性階的操作數量 = {}\n", .{count});
    var nums = [_]i32{0}**n;
    count = arrayTraversal(&nums);
    std.debug.print("線性階（走訪陣列）的操作數量 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("平方階的操作數量 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i));  // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("平方階（泡沫排序）的操作數量 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("指數階（迴圈實現）的操作數量 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("指數階（遞迴實現）的操作數量 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("對數階（迴圈實現）的操作數量 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("對數階（遞迴實現）的操作數量 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("線性對數階（遞迴實現）的操作數量 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("階乘階（遞迴實現）的操作數量 = {}\n", .{count});

    _ = try std.io.getStdIn().reader().readByte();
}

