// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 隨機訪問元素
pub fn randomAccess(nums: []i32) i32 {
    // 在區間 [0, nums.len) 中隨機抽取一個整數
    var randomIndex = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 獲取並返回隨機元素
    var randomNum = nums[randomIndex];
    return randomNum;
}

// 擴展陣列長度
pub fn extend(mem_allocator: std.mem.Allocator, nums: []i32, enlarge: usize) ![]i32 {
    // 初始化一個擴展長度後的陣列
    var res = try mem_allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);
    // 將原陣列中的所有元素複製到新陣列
    std.mem.copy(i32, res, nums);
    // 返回擴展後的新陣列
    return res;
}

// 在陣列的索引 index 處插入元素 num
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 把索引 index 以及之後的所有元素向後移動一位
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num;
}

// 刪除索引 index 處的元素
pub fn remove(nums: []i32, index: usize) void {
    // 把索引 index 之後的所有元素向前移動一位
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 走訪陣列
pub fn traverse(nums: []i32) void {
    var count: i32 = 0;
    // 透過索引走訪陣列
    var i: i32 = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }
    count = 0;
    // 直接走訪陣列元素
    for (nums) |num| {
        count += num;
    }
}

// 在陣列中查詢指定元素
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn main() !void {
    // 初始化記憶體分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化陣列
    var arr = [_]i32{0} ** 5;
    std.debug.print("陣列 arr = ", .{});
    inc.PrintUtil.printArray(i32, &arr);

    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    var nums = array[known_at_runtime_zero..];
    std.debug.print("\n陣列 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 隨機訪問
    var randomNum = randomAccess(nums);
    std.debug.print("\n在 nums 中獲取隨機元素 {}", .{randomNum});

    // 長度擴展
    nums = try extend(mem_allocator, nums, 3);
    std.debug.print("\n將陣列長度擴展至 8 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 插入元素
    insert(nums, 6, 3);
    std.debug.print("\n在索引 3 處插入數字 6 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 刪除元素
    remove(nums, 2);
    std.debug.print("\n刪除索引 2 處的元素，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, nums);

    // 走訪陣列
    traverse(nums);

    // 查詢元素
    var index = find(nums, 3);
    std.debug.print("\n在 nums 中查詢元素 3 ，得到索引 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}

