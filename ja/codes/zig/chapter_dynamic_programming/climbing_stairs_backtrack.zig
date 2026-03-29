// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// バックトラッキング
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // 第 n 段に到達したら、方法数を 1 増やす
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // すべての選択肢を走査
    for (choices) |choice| {
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n) {
            continue;
        }
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // バックトラック
    }
}

// 階段登り：バックトラッキング
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // 1 段または 2 段上ることを選べる
    var state: i32 = 0; // 第 0 段から上り始める
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // res[0] を使って方法数を記録する
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// Driver Code
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
