// File: climbing_stairs_dfs.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 탐색
fn dfs(i: usize) i32 {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1) + dfs(i - 2);
    return count;
}

// 계단 오르기: 탐색
fn climbingStairsDFS(comptime n: usize) i32 {
    return dfs(n);
}

// 실행 코드
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFS(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
