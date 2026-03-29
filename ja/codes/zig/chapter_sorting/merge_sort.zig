// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 左部分配列と右部分配列をマージする
// 左部分配列の区間は [left, mid]
// 右部分配列の区間は [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // 補助配列を初期化する
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // 左部分配列の開始添字と終了添字
    var leftStart = left - left;
    var leftEnd = mid - left;
    // 右部分配列の開始インデックスと終了インデックス
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i, j はそれぞれ左部分配列と右部分配列の先頭要素を指す
    var i = leftStart;
    var j = rightStart;
    // 元の配列 nums を上書きして左部分配列と右部分配列をマージする
    var k = left;
    while (k <= right) : (k += 1) {
        // 「左部分配列のマージがすべて完了している」場合は、右部分配列の要素を選び、`j++` する
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // そうでなければ、「右部分配列のマージがすべて完了している」または「左部分配列の要素 <= 右部分配列の要素」の場合、左部分配列の要素を選び、i++ する
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // そうでなければ、「左右の部分配列のマージがどちらも完了しておらず」かつ「左部分配列の要素 > 右部分配列の要素」の場合、右部分配列の要素を選び、j++ する
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// マージソート
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // 終了条件
    if (left >= right) return;              // 部分配列の長さが 1 になったら再帰を終了
    // 分割フェーズ
    var mid = left + (right - left) / 2;    // 中点を計算
    try mergeSort(nums, left, mid);         // 左部分配列を再帰処理
    try mergeSort(nums, mid + 1, right);    // 右部分配列を再帰処理
    // マージフェーズ
    try merge(nums, left, mid, right);
}

// Driver Code
pub fn main() !void {
    // マージソート
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("マージソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
