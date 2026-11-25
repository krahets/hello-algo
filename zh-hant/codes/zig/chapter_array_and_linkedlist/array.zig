// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 隨機存取元素
pub fn randomAccess(nums: []const i32) i32 {
    // 從區間 [0, nums.len) 隨機選取一個整數
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 取得並回傳隨機選出的元素
    const randomNum = nums[random_index];
    return randomNum;
}

// 增加陣列長度
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // 初始化加長後的陣列
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // 將原陣列的所有元素複製到新陣列
    std.mem.copyForwards(i32, res, nums);

    // 回傳加長後的新陣列
    return res;
}

// 在陣列的索引 index 處插入元素 num
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 將索引 index 起的所有元素往後移一格
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num;
}

// 刪除索引 index 處的元素
pub fn remove(nums: []i32, index: usize) void {
    // 將索引 index 之後的所有元素往前移一格
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 走訪陣列
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // 依索引走訪陣列
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // 直接走訪陣列中的元素
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // 同時走訪資料的索引和元素
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// 在陣列中尋找指定元素
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// 範例主程式
pub fn run() !void {
    // 初始化陣列
    const arr = [_]i32{0} ** 5;
    std.debug.print("陣列 arr = {}\n", .{utils.fmt.slice(&arr)});

    // 陣列切片
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // 透過執行時期的變數 known_at_runtime_zero，將指標轉為切片
    std.debug.print("陣列 nums = {}\n", .{utils.fmt.slice(nums)});

    // 隨機存取
    const randomNum = randomAccess(nums);
    std.debug.print("從 nums 隨機取得的元素為 {}\n", .{randomNum});

    // 初始化記憶體配置器
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // 增加長度
    nums = try extend(allocator, nums, 3);
    std.debug.print("將陣列長度增加至 8，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 插入元素
    insert(nums, 6, 3);
    std.debug.print("在索引 3 處插入數字 6，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 刪除元素
    remove(nums, 2);
    std.debug.print("刪除索引 2 處的元素，得到 nums = {}\n", .{utils.fmt.slice(nums)});

    // 走訪陣列
    traverse(nums);

    // 尋找元素
    const index = find(nums, 3);
    std.debug.print("在 nums 中尋找元素 3，得到索引 = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
