// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする
fn digit(num: i32, exp: i32) i32 {
    // k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    return @mod(@divFloor(num, exp), 10);
}

// カウントソート（nums の第 k 桁に基づくソート）
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // 0~9 の各数字の出現回数を数える
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // nums[i] の第 k 桁を取得し、d とする
        counter[d] += 1; // 数字 d の出現回数を数える
    }
    // 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // 配列内での d のインデックス j を取得する
        res[j] = nums[i];       // 現在の要素をインデックス j に入れる
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
    // 最大桁数を判定するため、配列の最大要素を取得する
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // 下位の桁から上位の桁へ順に走査する
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // 配列の要素の第 k 桁に対してカウントソートを行う
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // つまり exp = 10^(k-1)
        try countingSortDigit(nums, exp);    
    }
} 

// 実行用コード
pub fn main() !void {
    // 基数ソート
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("基数ソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}