// File: knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 0-1 背包：暴力搜索
fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // 若超过背包容量，则只能选择不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 计算不放入和放入物品 i 的最大价值
    var no = knapsackDFS(wgt, val, i - 1, c);
    var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 返回两种方案中价值更大的那一个
    return @max(no, yes);
}

// 0-1 背包：记忆化搜索
fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // 若已有记录，则直接返回
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 若超过背包容量，则只能选择不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 计算不放入和放入物品 i 的最大价值
    var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 记录并返回两种方案中价值更大的那一个
    mem[i][c] = @max(no, yes);
    return mem[i][c];
}

// 0-1 背包：动态规划
fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // 初始化 dp 表
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // 状态转移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 0-1 背包：空间优化后的动态规划
fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
    var n = wgt.len;
    // 初始化 dp 表
    var dp = [_]i32{0} ** (cap + 1);
    // 状态转移
    for (1..n + 1) |i| {
        // 倒序遍历
        var c = cap;
        while (c > 0) : (c -= 1) {
            if (wgt[i - 1] < c) {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver Code
pub fn main() !void {
    comptime var wgt = [_]i32{ 10, 20, 30, 40, 50 };
    comptime var val = [_]i32{ 50, 120, 150, 210, 240 };
    comptime var cap = 50;
    comptime var n = wgt.len;

    // 暴力搜索
    var res = knapsackDFS(&wgt, &val, n, cap);
    std.debug.print("不超过背包容量的最大物品价值为 {}\n", .{res});

    // 记忆搜索
    var mem = [_][cap + 1]i32{[_]i32{-1} ** (cap + 1)} ** (n + 1);
    res = knapsackDFSMem(&wgt, &val, @constCast(&mem), n, cap);
    std.debug.print("不超过背包容量的最大物品价值为 {}\n", .{res});

    // 动态规划
    res = knapsackDP(&wgt, &val, cap);
    std.debug.print("不超过背包容量的最大物品价值为 {}\n", .{res});

    // 空间优化后的动态规划
    res = knapsackDPComp(&wgt, &val, cap);
    std.debug.print("不超过背包容量的最大物品价值为 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
