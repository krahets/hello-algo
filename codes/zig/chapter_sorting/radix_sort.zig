// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 获取元素 num 的第 k 位，其中 exp = 10^(k-1)
fn digit(num: i32, exp: i32) i32 {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    return @mod(@divFloor(num, exp), 10);
}

// 计数排序（根据 nums 第 k 位排序）
fn countSort(nums: []i32, exp: i32) !void {
    // 十进制的各位数字范围为 0~9 ，因此需要长度为 10 的桶
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var bucket = try mem_allocator.alloc(usize, 10);
    std.mem.set(usize, bucket, 0);
    var n = nums.len;
    // 借助桶来统计 0~9 各数字的出现次数
    for (nums) |num| {
        var d = @bitCast(u32, digit(num, exp));    // 获取 nums[i] 第 k 位，记为 d
        bucket[d] += 1;             // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        bucket[i] += bucket[i - 1];
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入暂存数组 tmp
    var tmp = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d = @bitCast(u32, digit(nums[i], exp));
        var j = bucket[d] - 1;  // 获取 d 在数组中的索引 j
        tmp[j] = nums[i];       // 将当前元素填入索引 j
        bucket[d] -= 1;         // 将 d 的数量减 1
        if (i == 0) break;
    }
    // 将 tmp 复制到 nums
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = tmp[i];
    }
}

// 基数排序
fn radixSort(nums: []i32) !void {
    // 获取数组的最大元素，用于判断最大位数
    var ma: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > ma) ma = num;
    }
    // 按照从低位到高位的顺序遍历
    var exp: i32 = 1;
    while (ma >= exp) : (exp *= 10) {
        // 对数组元素的第 k 位执行「计数排序」
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // k = 3 -> exp = 100
        // 即 exp = 10^(k-1)
        try countSort(nums, exp);    
    }
} 

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 基数排序
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("基数排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}