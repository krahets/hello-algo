// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 編集距離：総当たり探索
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // s と t がともに空なら 0 を返す
    if (i == 0 and j == 0) {
        return 0;
    }
    // s が空なら t の長さを返す
    if (i == 0) {
        return @intCast(j);
    }
    // t が空なら s の長さを返す
    if (j == 0) {
        return @intCast(i);
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集回数を返す
    return @min(@min(insert, delete), replace) + 1;
}

// 編集距離：メモ化探索
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // s と t がともに空なら 0 を返す
    if (i == 0 and j == 0) {
        return 0;
    }
    // s が空なら t の長さを返す
    if (i == 0) {
        return @intCast(j);
    }
    // t が空なら s の長さを返す
    if (j == 0) {
        return @intCast(i);
    }
    // 記録済みなら、それをそのまま返す
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 最小編集回数を記録して返す
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// 編集距離：動的計画法
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // 状態遷移：先頭行と先頭列
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // 状態遷移: 残りの行と列
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// 編集距離：空間最適化した動的計画法
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // 状態遷移：先頭行
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // 状態遷移：残りの行
    for (1..n + 1) |i| {
        // 状態遷移：先頭列
        var leftup = dp[0]; // dp[i-1, j-1] を一時保存する
        dp[0] = @intCast(i);
        // 状態遷移：残りの列
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup;
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
        }
    }
    return dp[m];
}

// Driver Code
pub fn main() !void {
    const s = "bag";
    const t = "pack";
    comptime var n = s.len;
    comptime var m = t.len;

    // 全探索
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("{s} を {s} に変更するには最小で {} 回の編集が必要です\n", .{ s, t, res });

    // メモ化探索
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("{s} を {s} に変更するには最小で {} 回の編集が必要です\n", .{ s, t, res });

    // 動的計画法
    res = editDistanceDP(s, t);
    std.debug.print("{s} を {s} に変更するには最小で {} 回の編集が必要です\n", .{ s, t, res });

    // 空間最適化後の動的計画法
    res = editDistanceDPComp(s, t);
    std.debug.print("{s} を {s} に変更するには最小で {} 回の編集が必要です\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
