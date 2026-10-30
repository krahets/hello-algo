// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Backtracking
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // When step n is reached, increase the number of ways by 1
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // Iterate over all choices
    for (choices) |choice| {
        // Prune: do not go beyond step n
        if (state + choice > n) {
            continue;
        }
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

// Climbing stairs: backtracking
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // Choose to climb 1 or 2 steps
    var state: i32 = 0; // Start climbing from step 0
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // Use res.items[0] to record the number of solutions
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// Driver code
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
