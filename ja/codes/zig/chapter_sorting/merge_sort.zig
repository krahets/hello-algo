// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 左部分配列と右部分配列をマージする
// 左部分配列の区間 [left, mid]
// 右部分配列の区間 [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // 補助配列を初期化する
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // 左部分配列の開始インデックスと終了インデックス
    var leftStart = left - left;
    var leftEnd = mid - left;
    // 右部分配列の開始インデックスと終了インデックス
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i, j は左部分配列と右部分配列の先頭要素をそれぞれ指す
    var i = leftStart;
    var j = rightStart;
    // 元の配列 nums を上書きしながら、左部分配列と右部分配列をマージする
    var k = left;
    while (k <= right) : (k += 1) {
        // 「左部分配列をすべてマージ済み」の場合、右部分配列の要素を選び、j++ とする
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // そうでなく、「右部分配列をすべてマージ済み」または「左部分配列の要素 <= 右部分配列の要素」の場合、左部分配列の要素を選び、i++ とする
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // そうでなく、「左右とも未マージの要素がある」かつ「左部分配列の要素 > 右部分配列の要素」の場合、右部分配列の要素を選び、j++ とする
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// マージソート
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // 終了条件
    if (left >= right) return;              // 部分配列の長さが 1 になったら再帰を終了する
    // 分割段階
    var mid = left + (right - left) / 2;    // 中央を計算する
    try mergeSort(nums, left, mid);         // 左部分配列を再帰的に処理する
    try mergeSort(nums, mid + 1, right);    // 右部分配列を再帰的に処理する
    // マージ段階
    try merge(nums, left, mid, right);
}

// 実行用コード
pub fn main() !void {
    // マージソート
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("マージソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
