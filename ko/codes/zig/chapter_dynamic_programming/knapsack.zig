// File: knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 0-1 배낭: 완전 탐색
fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 or c == 0) {
        return 0;
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    var no = knapsackDFS(wgt, val, i - 1, c);
    var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 두 경우 중 더 큰 가치를 반환한다
    return @max(no, yes);
}

// 0-1 배낭: 메모이제이션을 이용한 탐색
fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 or c == 0) {
        return 0;
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // 두 경우 중 더 큰 가치를 기록하고 반환한다
    mem[i][c] = @max(no, yes);
    return mem[i][c];
}

// 0-1 배낭: 동적 계획법
fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // dp 테이블을 초기화한다
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // 상태 전이
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 0-1 배낭: 공간을 최적화한 동적 계획법
fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
    var n = wgt.len;
    // dp 테이블을 초기화한다
    var dp = [_]i32{0} ** (cap + 1);
    // 상태 전이
    for (1..n + 1) |i| {
        // 역방향 순회
        var c = cap;
        while (c > 0) : (c -= 1) {
            if (wgt[i - 1] < c) {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// 실행 코드
pub fn main() !void {
    comptime var wgt = [_]i32{ 10, 20, 30, 40, 50 };
    comptime var val = [_]i32{ 50, 120, 150, 210, 240 };
    comptime var cap = 50;
    comptime var n = wgt.len;

    // 완전 탐색
    var res = knapsackDFS(&wgt, &val, n, cap);
    std.debug.print("배낭 용량을 초과하지 않는 물건의 최대 가치: {}\n", .{res});

    // 메모이제이션을 이용한 탐색
    var mem = [_][cap + 1]i32{[_]i32{-1} ** (cap + 1)} ** (n + 1);
    res = knapsackDFSMem(&wgt, &val, @constCast(&mem), n, cap);
    std.debug.print("배낭 용량을 초과하지 않는 물건의 최대 가치: {}\n", .{res});

    // 동적 계획법
    res = knapsackDP(&wgt, &val, cap);
    std.debug.print("배낭 용량을 초과하지 않는 물건의 최대 가치: {}\n", .{res});

    // 공간을 최적화한 동적 계획법
    res = knapsackDPComp(&wgt, &val, cap);
    std.debug.print("배낭 용량을 초과하지 않는 물건의 최대 가치: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
