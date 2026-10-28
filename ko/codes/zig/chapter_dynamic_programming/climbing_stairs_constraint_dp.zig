// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 제약 조건이 있는 계단 오르기: 동적 계획법
fn climbingStairsConstraintDP(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return 1;
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (3..n + 1) |i| {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

// 실행 코드
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsConstraintDP(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
