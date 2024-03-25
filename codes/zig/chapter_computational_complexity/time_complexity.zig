// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 常数阶
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

// 线性阶
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 线性阶（遍历数组）
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // 循环次数与数组长度成正比
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// 平方阶
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // 循环次数与数据大小 n 成平方关系
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// 平方阶（冒泡排序）
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0;  // 计数器 
    // 外循环：未排序区间为 [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3;  // 元素交换包含 3 个单元操作
            }
        }
    }
    return count;
}

// 指数阶（循环实现）
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
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

// 指数阶（递归实现）
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// 对数阶（循环实现）
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

// 对数阶（递归实现）
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(n / 2) + 1;
}

// 线性对数阶
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 阶乘阶（递归实现）
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // 从 1 个分裂出 n 个
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// Driver Code
pub fn main() !void {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    const n: i32 = 8;
    std.debug.print("输入数据大小 n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("常数阶的操作数量 = {}\n", .{count});

    count = linear(n);
    std.debug.print("线性阶的操作数量 = {}\n", .{count});
    var nums = [_]i32{0}**n;
    count = arrayTraversal(&nums);
    std.debug.print("线性阶（遍历数组）的操作数量 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("平方阶的操作数量 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i));  // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("平方阶（冒泡排序）的操作数量 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("指数阶（循环实现）的操作数量 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("指数阶（递归实现）的操作数量 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("对数阶（循环实现）的操作数量 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("对数阶（递归实现）的操作数量 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("线性对数阶（递归实现）的操作数量 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("阶乘阶（递归实现）的操作数量 = {}\n", .{count});

    _ = try std.io.getStdIn().reader().readByte();
}

