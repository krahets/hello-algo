// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 随机访问元素
pub fn randomAccess(nums: []const i32) i32 {
    // 在区间 [0, nums.len) 中随机抽取一个整数
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 获取并返回随机元素
    const randomNum = nums[random_index];
    return randomNum;
}

// 扩展数组长度
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // 初始化一个扩展长度后的数组
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // 将原数组中的所有元素复制到新数组
    std.mem.copyForwards(i32, res, nums);

    // 返回扩展后的新数组
    return res;
}

// 在数组的索引 index 处插入元素 num
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 把索引 index 以及之后的所有元素向后移动一位
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num;
}

// 删除索引 index 处的元素
pub fn remove(nums: []i32, index: usize) void {
    // 把索引 index 之后的所有元素向前移动一位
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 遍历数组
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // 通过索引遍历数组
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // 直接遍历数组元素
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // 同时遍历数据索引和元素
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// 在数组中查找指定元素
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn run() !void {
    // 初始化数组
    const arr = [_]i32{0} ** 5;
    std.debug.print("数组 arr = {}\n", .{utils.fmt.slice(&arr)});

    // 数组切片
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // 通过 known_at_runtime_zero 运行时变量将指针变切片
    std.debug.print("数组 nums = {}\n", .{utils.fmt.slice(nums)});

    // 随机访问
    const randomNum = randomAccess(nums);
    std.debug.print("在 nums 中获取随机元素 {}\n", .{randomNum});

    // 初始化内存分配器
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // 长度扩展
    nums = try extend(allocator, nums, 3);
    std.debug.print("将数组长度扩展至 8 ，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 插入元素
    insert(nums, 6, 3);
    std.debug.print("在索引 3 处插入数字 6 ，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 删除元素
    remove(nums, 2);
    std.debug.print("删除索引 2 处的元素，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 遍历数组
    traverse(nums);

    // 查找元素
    const index = find(nums, 3);
    std.debug.print("在 nums 中查找元素 3 ，得到索引 = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
