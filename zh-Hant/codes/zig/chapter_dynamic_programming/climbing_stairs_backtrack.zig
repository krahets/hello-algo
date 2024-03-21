// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 回溯
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // 当爬到第 n 阶时，方案数量加 1
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // 遍历所有选择
    for (choices) |choice| {
        // 剪枝：不允许越过第 n 阶
        if (state + choice > n) {
            continue;
        }
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

// 爬楼梯：回溯
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // 可选择向上爬 1 阶或 2 阶
    var state: i32 = 0; // 从第 0 阶开始爬
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // 使用 res[0] 记录方案数量
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// Driver Code
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
