// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 要素へランダムアクセス
pub fn randomAccess(nums: []const i32) i32 {
    // 区間 [0, nums.len) からランダムに整数を 1 つ選ぶ
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // ランダムな要素を取得して返す
    const randomNum = nums[random_index];
    return randomNum;
}

// 配列長を拡張する
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // 拡張後の長さを持つ配列を初期化する
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // 元の配列の全要素を新しい配列にコピー
    std.mem.copyForwards(i32, res, nums);

    // 拡張後の新しい配列を返す
    return res;
}

// 配列の index 番目に要素 num を挿入
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // index の要素に num を代入する
    nums[index] = num;
}

// index の要素を削除する
pub fn remove(nums: []i32, index: usize) void {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 配列を走査
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // インデックスで配列を走査
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // 配列要素を直接走査
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // データのインデックスと要素を同時に走査する
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// 配列内で指定要素を探す
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn run() !void {
    // 配列を初期化
    const arr = [_]i32{0} ** 5;
    std.debug.print("配列 arr = {}\n", .{utils.fmt.slice(&arr)});

    // 配列スライス
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // 実行時変数 known_at_runtime_zero を用いてポインタをスライスに変換する
    std.debug.print("配列 nums = {}\n", .{utils.fmt.slice(nums)});

    // ランダムアクセス
    const randomNum = randomAccess(nums);
    std.debug.print("nums からランダムな要素 {} を取得\n", .{randomNum});

    // メモリアロケータを初期化する
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // 長さを拡張
    nums = try extend(allocator, nums, 3);
    std.debug.print("配列の長さを 8 に拡張し、nums = {} を得る\n", .{utils.fmt.slice(nums)});

    // 要素を挿入する
    insert(nums, 6, 3);
    std.debug.print("インデックス 3 に数値 6 を挿入し、nums = {} を得る\n", .{utils.fmt.slice(nums)});

    // 要素を削除
    remove(nums, 2);
    std.debug.print("インデックス 2 の要素を削除し、nums = {} を得る\n", .{utils.fmt.slice(nums)});

    // 配列を走査
    traverse(nums);

    // 要素を探索する
    const index = find(nums, 3);
    std.debug.print("nums で要素 3 を検索し、インデックス = {} を得る\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
