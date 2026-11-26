// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 임의의 원소에 접근
pub fn randomAccess(nums: []const i32) i32 {
    // 구간 [0, nums.len)에서 정수 하나를 무작위로 선택
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 선택한 원소를 가져와 반환
    const randomNum = nums[random_index];
    return randomNum;
}

// 배열 길이 늘리기
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // 길이를 늘린 새 배열 초기화
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // 원래 배열의 모든 원소를 새 배열에 복사
    std.mem.copyForwards(i32, res, nums);

    // 길이를 늘린 새 배열 반환
    return res;
}

// 배열의 인덱스 index에 원소 num 삽입
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // 인덱스 index의 원소에 num 대입
    nums[index] = num;
}

// 인덱스 index의 원소 삭제
pub fn remove(nums: []i32, index: usize) void {
    // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 배열 순회
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // 인덱스로 배열 순회
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // 배열 원소를 직접 순회
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // 인덱스와 원소를 함께 순회
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// 배열에서 지정한 원소 찾기
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// 실행 예제
pub fn run() !void {
    // 배열 초기화
    const arr = [_]i32{0} ** 5;
    std.debug.print("배열 arr = {}\n", .{utils.fmt.slice(&arr)});

    // 배열 슬라이스
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // 런타임 변수 known_at_runtime_zero를 사용해 포인터를 슬라이스로 변환
    std.debug.print("배열 nums = {}\n", .{utils.fmt.slice(nums)});

    // 임의 접근
    const randomNum = randomAccess(nums);
    std.debug.print("nums에서 무작위로 선택한 원소: {}\n", .{randomNum});

    // 메모리 할당자 초기화
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // 길이 늘리기
    nums = try extend(allocator, nums, 3);
    std.debug.print("길이를 8로 늘린 배열 nums = {}\n", .{utils.fmt.slice(nums)});

    // 원소 삽입
    insert(nums, 6, 3);
    std.debug.print("인덱스 3에 숫자 6을 삽입한 후 nums = {}\n", .{utils.fmt.slice(nums)});

    // 원소 삭제
    remove(nums, 2);
    std.debug.print("인덱스 2의 원소를 삭제한 후 nums = {}\n", .{utils.fmt.slice(nums)});

    // 배열 순회
    traverse(nums);

    // 원소 찾기
    const index = find(nums, 3);
    std.debug.print("nums에서 원소 3을 찾은 인덱스 = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
