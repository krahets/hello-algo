// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 백트래킹
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // 모든 선택지를 순회한다
    for (choices) |choice| {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if (state + choice > n) {
            continue;
        }
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 되돌리기
    }
}

// 계단 오르기: 백트래킹
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    var state: i32 = 0; // 0번째 계단에서 오르기 시작한다
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // res[0]에 방법의 수를 기록한다
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// 실행 코드
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("계단 {}칸을 오르는 방법의 수: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
