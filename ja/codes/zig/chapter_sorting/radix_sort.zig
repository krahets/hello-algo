// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 要素 num の下から k 桁目を取得（exp = 10^(k-1)）
fn digit(num: i32, exp: i32) i32 {
    // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    return @mod(@divFloor(num, exp), 10);
}

// 計数ソート（nums の k 桁目でソート）
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // 0~9 の各数字の出現回数を集計する
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // nums[i] の第 k 位を取得し、d とする
        counter[d] += 1; // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列インデックス」に変換する
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // d の配列内インデックス j を取得する
        res[j] = nums[i];       // 現在の要素をインデックス j に格納する
        counter[d] -= 1;        // d の個数を 1 減らす
        if (i == 0) break;
    }
    // 結果で元の配列 nums を上書きする
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = res[i];
    }
}

// 基数ソート
fn radixSort(nums: []i32) !void {
    // 最大桁数の判定用に配列の最大要素を取得
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // 下位桁から上位桁の順に走査する
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // 配列要素の k 桁目に対して計数ソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        try countingSortDigit(nums, exp);    
    }
} 

// Driver Code
pub fn main() !void {
    // 基数ソート
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("基数ソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}