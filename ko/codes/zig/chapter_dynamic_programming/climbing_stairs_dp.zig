// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 계단 오르기: 동적 계획법
fn climbingStairsDP(comptime n: usize) i32 {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = [_]i32{-1} ** (n + 1);
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// 계단 오르기: 공간을 최적화한 동적 계획법
fn climbingStairsDPComp(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    var a: i32 = 1;
    var b: i32 = 2;
    for (3..n + 1) |_| {
        var tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

// 실행 코드
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDP(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
