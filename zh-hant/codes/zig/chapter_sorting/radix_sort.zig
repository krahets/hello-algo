// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 獲取元素 num 的第 k 位，其中 exp = 10^(k-1)
fn digit(num: i32, exp: i32) i32 {
    // 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
    return @mod(@divFloor(num, exp), 10);
}

// 計數排序（根據 nums 第 k 位排序）
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // 統計 0~9 各數字的出現次數
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // 獲取 nums[i] 第 k 位，記為 d
        counter[d] += 1; // 統計數字 d 的出現次數
    }
    // 求前綴和，將“出現個數”轉換為“陣列索引”
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // 倒序走訪，根據桶內統計結果，將各元素填入 res
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // 獲取 d 在陣列中的索引 j
        res[j] = nums[i];       // 將當前元素填入索引 j
        counter[d] -= 1;        // 將 d 的數量減 1
        if (i == 0) break;
    }
    // 使用結果覆蓋原陣列 nums
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = res[i];
    }
}

// 基數排序
fn radixSort(nums: []i32) !void {
    // 獲取陣列的最大元素，用於判斷最大位數
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // 按照從低位到高位的順序走訪
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // 對陣列元素的第 k 位執行計數排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        try countingSortDigit(nums, exp);    
    }
} 

// Driver Code
pub fn main() !void {
    // 基數排序
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("基數排序完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}