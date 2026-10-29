// File: knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 0-1 ナップサック問題：全探索
fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if (i == 0 or c == 0) {
        return 0;
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    var no = knapsackDFS(wgt, val, i - 1, c);
    var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを返す
    return @max(no, yes);
}

// 0-1 ナップサック問題：メモ化探索
fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if (i == 0 or c == 0) {
        return 0;
    }
    // 記録済みなら、その値をそのまま返す
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを記録して返す
    mem[i][c] = @max(no, yes);
    return mem[i][c];
}

// 0-1 ナップサック問題：動的計画法
fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // dp テーブルを初期化する
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 0-1 ナップサック問題：空間を最適化した動的計画法
fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
    var n = wgt.len;
    // dp テーブルを初期化する
    var dp = [_]i32{0} ** (cap + 1);
    // 状態遷移
    for (1..n + 1) |i| {
        // 逆順に走査する
        var c = cap;
        while (c > 0) : (c -= 1) {
            if (wgt[i - 1] < c) {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// 実行用コード
pub fn main() !void {
    comptime var wgt = [_]i32{ 10, 20, 30, 40, 50 };
    comptime var val = [_]i32{ 50, 120, 150, 210, 240 };
    comptime var cap = 50;
    comptime var n = wgt.len;

    // 全探索
    var res = knapsackDFS(&wgt, &val, n, cap);
    std.debug.print("ナップサックの容量を超えない品物の最大価値は {}\n", .{res});

    // メモ化探索
    var mem = [_][cap + 1]i32{[_]i32{-1} ** (cap + 1)} ** (n + 1);
    res = knapsackDFSMem(&wgt, &val, @constCast(&mem), n, cap);
    std.debug.print("ナップサックの容量を超えない品物の最大価値は {}\n", .{res});

    // 動的計画法
    res = knapsackDP(&wgt, &val, cap);
    std.debug.print("ナップサックの容量を超えない品物の最大価値は {}\n", .{res});

    // 空間を最適化した動的計画法
    res = knapsackDPComp(&wgt, &val, cap);
    std.debug.print("ナップサックの容量を超えない品物の最大価値は {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
