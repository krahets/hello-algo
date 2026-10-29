// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// バックトラッキング
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // n 段目に到達したら、方法の数を 1 増やす
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // すべての選択肢を走査する
    for (choices) |choice| {
        // 枝刈り：n 段目を越えてはならない
        if (state + choice > n) {
            continue;
        }
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 復元
    }
}

// 階段の上り方：バックトラッキング
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // 1 段または 2 段上ることを選択できる
    var state: i32 = 0; // 0 段目から上り始める
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // res[0] に方法の数を記録する
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// 実行用コード
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
