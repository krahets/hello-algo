// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 回溯
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // 當爬到第 n 階時，方案數量加 1
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // 走訪所有選擇
    for (choices) |choice| {
        // 剪枝：不允許越過第 n 階
        if (state + choice > n) {
            continue;
        }
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

// 爬樓梯：回溯
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // 可選擇向上爬 1 階或 2 階
    var state: i32 = 0; // 從第 0 階開始爬
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // 使用 res[0] 記錄方案數量
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// Driver Code
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("爬 {} 階樓梯共有 {} 種方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
