// File: coin_change_ii.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 동전 교환 II: 동적 계획법
fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // dp 테이블을 초기화한다
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // 첫 번째 열을 초기화한다
    for (0..n + 1) |i| {
        dp[i][0] = 1;
    }
    // 상태 전이
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[n][amt];
}

// 동전 교환 II: 공간을 최적화한 동적 계획법
fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // dp 테이블을 초기화한다
    var dp = [_]i32{0} ** (amt + 1);
    dp[0] = 1;
    // 상태 전이
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = dp[a] + dp[a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[amt];
}

// 실행 코드
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 5;

    // 동적 계획법
    var res = coinChangeIIDP(&coins, amt);
    std.debug.print("목표 금액을 만드는 동전 조합의 수: {}\n", .{res});

    // 공간을 최적화한 동적 계획법
    res = coinChangeIIDPComp(&coins, amt);
    std.debug.print("목표 금액을 만드는 동전 조합의 수: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
