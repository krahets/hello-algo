// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 계단 오르기의 최소 비용: 동적 계획법
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = [_]i32{-1} ** (n + 1);
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (3..n + 1) |i| {
        var tmp = b;
        b = @min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

// 실행 코드
pub fn main() !void {
    comptime var cost = [_]i32{ 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
    std.debug.print("입력한 계단 비용 리스트: {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("입력한 계단 비용 리스트: {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("입력한 계단 비용 리스트: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
