// File: array.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 随机返回一个数组元素
pub fn randomAccess(nums: []i32) i32 {
    // 在区间 [0, nums.len) 中随机抽取一个整数
    var randomIndex = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 获取并返回随机元素
    var randomNum = nums[randomIndex];
    return randomNum;
}

// 扩展数组长度（运行时方法）
pub fn extend(mem_allocator: std.mem.Allocator, nums: []i32, enlarge: usize) ![]i32 {
    // 初始化一个扩展长度后的数组
    var res = try mem_allocator.alloc(i32, nums.len + enlarge);
    std.mem.set(i32, res, 0);
    // 将原数组中的所有元素复制到新数组
    std.mem.copy(i32, res, nums);
    // 返回扩展后的新数组
    return res;
}

// 扩展数组长度（编译期方法A：初始化新数组并进行元素拷贝）
pub fn extendComptimeA(comptime nums: anytype, comptime enlarge: i32) [nums.len + enlarge]i32 {
    // 初始化一个扩展长度后的数组
    var res = [_]i32{0} ** (nums.len + enlarge);
    // 将原数组中的所有元素复制到新数组
    for (nums) |num, i| {
        res[i] = num;
    }
    // 返回扩展后的新数组
    return res;
}

// 扩展数组长度（编译期方法B: 通过数组拼接运算符“++”）
pub fn extendComptimeB(comptime nums: anytype, comptime enlarge: i32) [nums.len + enlarge]i32 {
    // 数组拼接操作
    var res = nums ++ [_]i32{0} ** enlarge;
    // 返回拼接后的新数组
    return res;
}

// 在数组的索引 index 处插入元素 num
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 把索引 index 以及之后的所有元素向后移动一位
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处元素
    nums[index] = num;
}

// 删除索引 index 处元素
pub fn remove(nums: []i32, index: usize) void {
    // 把索引 index 之后的所有元素向前移动一位
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 遍历数组
pub fn traverse(nums: []i32) void {
    var count: i32 = 0;
    // 通过索引遍历数组
    var i: i32 = 0;
    while (i < nums.len) : (i += 1) {
        count += 1;
    }
    count = 0;
    // 直接遍历数组
    for (nums) |_| {
        count += 1;
    }
}

// 在数组中查找指定元素
pub fn find(nums: []i32, target: i32) i32 {
    for (nums) |num, i| {
        if (num == target) return @intCast(i32, i);
    }
    return -1;
}

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化数组
    const size: i32 = 5;
    var arr = [_]i32{0} ** size;
    std.debug.print("数组 arr = ", .{});
    inc.PrintUtil.printArray(i32, &arr);

    var array = [_]i32{ 1, 3, 2, 5, 4 };
    std.debug.print("\n数组 nums = ", .{});
    inc.PrintUtil.printArray(i32, &array);

    // 随机访问
    var randomNum = randomAccess(&array);
    std.debug.print("\n在 nums 中获取随机元素 {}", .{randomNum});

    // 长度扩展（运行时方法）
    var known_at_runtime_zero: usize = 0;
    var nums: []i32 = array[known_at_runtime_zero..array.len];
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    nums = try extend(mem_allocator, nums, 3);
    std.debug.print("\n将数组长度扩展至 8 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);
    // {
    //     // 长度扩展（编译期方法）
    //     comptime var array_comptime = [_]i32{ 1, 3, 2, 5, 4 };
    //     var nums_comptime = extendComptimeA(array_comptime, 3);
    //     // var nums_comptime = extendComptimeB(array_comptime, 3);
    //     std.debug.print("\n将数组长度扩展至 8 ，得到 nums_comptime = ", .{});
    //     inc.PrintUtil.printArray(i32, &nums_comptime);
    // }

    // 插入元素
    insert(nums, 6, 3);
    std.debug.print("\n在索引 3 处插入数字 6 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 删除元素
    remove(nums, 2);
    std.debug.print("\n删除索引 2 处的元素，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 遍历数组
    traverse(nums);

    // 查找元素
    var index = find(nums, 3);
    std.debug.print("\n在 nums_ext 中查找元素 3 ，得到索引 = {}\n", .{index});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

