// File: unbounded_knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 完全背包：動態規劃
fn unboundedKnapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // 初始化 dp 表
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // 狀態轉移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = @max(dp[i - 1][c], dp[i][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 完全背包：空間最佳化後的動態規劃
fn unboundedKnapsackDPComp(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // 初始化 dp 表
    var dp = [_]i32{0} ** (cap + 1);
    // 狀態轉移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // 若超過背包容量，則不選物品 i
                dp[c] = dp[c];
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver Code
pub fn main() !void {
    comptime var wgt = [_]i32{ 1, 2, 3 };
    comptime var val = [_]i32{ 5, 11, 15 };
    comptime var cap = 4;

    // 動態規劃
    var res = unboundedKnapsackDP(&wgt, &val, cap);
    std.debug.print("不超過背包容量的最大物品價值為 {}\n", .{res});

    // 空間最佳化後的動態規劃
    res = unboundedKnapsackDPComp(&wgt, &val, cap);
    std.debug.print("不超過背包容量的最大物品價值為 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
