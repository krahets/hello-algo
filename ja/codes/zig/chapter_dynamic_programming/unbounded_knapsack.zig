// File: unbounded_knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 完全ナップサック問題：動的計画法
fn unboundedKnapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // dp テーブルを初期化
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = @max(dp[i - 1][c], dp[i][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 完全ナップサック問題：空間最適化後の動的計画法
fn unboundedKnapsackDPComp(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // dp テーブルを初期化
    var dp = [_]i32{0} ** (cap + 1);
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[c] = dp[c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
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

    // 動的計画法
    var res = unboundedKnapsackDP(&wgt, &val, cap);
    std.debug.print("ナップサック容量を超えない最大価値は {}\n", .{res});

    // 空間最適化後の動的計画法
    res = unboundedKnapsackDPComp(&wgt, &val, cap);
    std.debug.print("ナップサック容量を超えない最大価値は {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
