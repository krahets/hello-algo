// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二分探索（両閉区間）
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // ループし、探索区間が空になったら終了する（i > j で空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 中点インデックス m を計算
        if (nums.items[m] < target) {           // この場合、target は区間 [m+1, j] にある
            i = m + 1;
        } else if (nums.items[m] > target) {    // この場合、target は区間 [i, m-1] にある
            j = m - 1;
        } else {                                // 目標要素が見つかったらそのインデックスを返す
            return @intCast(m);
        }
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

// 二分探索（左閉右開区間）
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    var i: usize = 0;
    var j: usize = nums.items.len;
    // ループし、探索区間が空になったら終了する（i = j で空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 中点インデックス m を計算
        if (nums.items[m] < target) {           // この場合、target は区間 [m+1, j) にある
            i = m + 1;
        } else if (nums.items[m] > target) {    // この場合、target は区間 [i, m) にある
            j = m;
        } else {                                // 目標要素が見つかったらそのインデックスを返す
            return @intCast(m);
        }
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 6;
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 });

    // 二分探索（両閉区間）
    var index = binarySearch(i32, nums, target);
    std.debug.print("対象要素 6 のインデックス = {}\n", .{index});

    // 二分探索（左閉右開区間）
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("対象要素 6 のインデックス = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}