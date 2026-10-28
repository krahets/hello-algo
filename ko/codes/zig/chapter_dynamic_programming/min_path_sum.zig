// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 최소 경로 합: 완전 탐색
fn minPathSumDFS(grid: anytype, i: i32, j: i32) i32 {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    var up = minPathSumDFS(grid, i - 1, j);
    var left = minPathSumDFS(grid, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 최소 경로 합: 메모이제이션을 이용한 탐색
fn minPathSumDFSMem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    var up = minPathSumDFSMem(grid, mem, i - 1, j);
    var left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 최소 경로 합: 동적 계획법
fn minPathSumDP(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // dp 테이블을 초기화한다
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // 상태 전이: 첫 번째 행
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 상태 전이: 첫 번째 열
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 상태 전이: 나머지 행과 열
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// 최소 경로 합: 공간을 최적화한 동적 계획법
fn minPathSumDPComp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // dp 테이블을 초기화한다
    var dp = [_]i32{0} ** m;
    // 상태 전이: 첫 번째 행
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 상태 전이: 나머지 행
    for (1..n) |i| {
        // 상태 전이: 첫 번째 열
        dp[0] = dp[0] + grid[i][0];
        for (1..m) |j| {
            dp[j] = @min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

// 실행 코드
pub fn main() !void {
    comptime var grid = [_][4]i32{
        [_]i32{ 1, 3, 1, 5 },
        [_]i32{ 2, 2, 4, 2 },
        [_]i32{ 5, 3, 2, 1 },
        [_]i32{ 4, 3, 5, 2 },
    };
    comptime var n = grid.len;
    comptime var m = grid[0].len;

    // 완전 탐색
    var res = minPathSumDFS(&grid, n - 1, m - 1);
    std.debug.print("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: {}\n", .{res});

    // 메모이제이션을 이용한 탐색
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = minPathSumDFSMem(&grid, &mem, n - 1, m - 1);
    std.debug.print("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: {}\n", .{res});

    // 동적 계획법
    res = minPathSumDP(&grid);
    std.debug.print("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: {}\n", .{res});

    // 공간을 최적화한 동적 계획법
    res = minPathSumDPComp(&grid);
    std.debug.print("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
