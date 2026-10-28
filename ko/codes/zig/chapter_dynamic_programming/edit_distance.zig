// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 편집 거리: 완전 탐색
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 and j == 0) {
        return 0;
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0) {
        return @intCast(j);
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0) {
        return @intCast(i);
    }
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 최소 편집 횟수를 반환한다
    return @min(@min(insert, delete), replace) + 1;
}

// 편집 거리: 메모이제이션을 이용한 탐색
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if (i == 0 and j == 0) {
        return 0;
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if (i == 0) {
        return @intCast(j);
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if (j == 0) {
        return @intCast(i);
    }
    // 기록이 이미 있으면 해당 값을 바로 반환한다
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 두 문자가 같으면 두 문자를 바로 건너뛴다
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// 편집 거리: 동적 계획법
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // 상태 전이: 나머지 행과 열
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// 편집 거리: 공간을 최적화한 동적 계획법
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // 상태 전이: 첫 번째 행
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // 상태 전이: 나머지 행
    for (1..n + 1) |i| {
        // 상태 전이: 첫 번째 열
        var leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
        dp[0] = @intCast(i);
        // 상태 전이: 나머지 열
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 두 문자가 같으면 두 문자를 바로 건너뛴다
                dp[j] = leftup;
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
        }
    }
    return dp[m];
}

// 실행 코드
pub fn main() !void {
    const s = "bag";
    const t = "pack";
    comptime var n = s.len;
    comptime var m = t.len;

    // 완전 탐색
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("{s} → {s} 변경에 필요한 최소 편집 횟수: {}\n", .{ s, t, res });

    // 메모이제이션을 이용한 탐색
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("{s} → {s} 변경에 필요한 최소 편집 횟수: {}\n", .{ s, t, res });

    // 동적 계획법
    res = editDistanceDP(s, t);
    std.debug.print("{s} → {s} 변경에 필요한 최소 편집 횟수: {}\n", .{ s, t, res });

    // 공간을 최적화한 동적 계획법
    res = editDistanceDPComp(s, t);
    std.debug.print("{s} → {s} 변경에 필요한 최소 편집 횟수: {}\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
