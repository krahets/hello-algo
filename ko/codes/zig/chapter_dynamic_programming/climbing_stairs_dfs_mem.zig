// File: climbing_stairs_dfs_mem.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 메모이제이션을 이용한 탐색
fn dfs(i: usize, mem: []i32) i32 {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if (mem[i] != -1) {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i]를 기록한다
    mem[i] = count;
    return count;
}

// 계단 오르기: 메모이제이션을 이용한 탐색
fn climbingStairsDFSMem(comptime n: usize) i32 {
    // mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    var mem = [_]i32{ -1 } ** (n + 1);
    return dfs(n, &mem);
}

// 실행 코드
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFSMem(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
