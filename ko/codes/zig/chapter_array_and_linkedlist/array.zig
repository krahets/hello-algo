// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 원소에 임의 접근
pub fn randomAccess(nums: []const i32) i32 {
    // 구간 [0, nums.len)에서 정수 하나를 무작위로 뽑는다
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // 무작위 원소를 가져와 반환한다
    const randomNum = nums[random_index];
    return randomNum;
}

// 배열 길이 확장
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // 길이를 확장한 배열을 초기화한다
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // 원래 배열의 모든 원소를 새 배열에 복사한다
    std.mem.copyForwards(i32, res, nums);

    // 확장한 새 배열을 반환한다
    return res;
}

// 배열의 인덱스 index에 원소 num 삽입
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num;
}

// 인덱스 index에 있는 원소 삭제
pub fn remove(nums: []i32, index: usize) void {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// 배열 순회
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // 인덱스를 통해 배열을 순회한다
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // 배열의 원소를 직접 순회한다
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // 데이터의 인덱스와 원소를 함께 순회한다
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// 배열에서 지정한 원소 탐색
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// 실행 코드
pub fn run() !void {
    // 배열 초기화
    const arr = [_]i32{0} ** 5;
    std.debug.print("배열 arr = {}\n", .{utils.fmt.slice(&arr)});

    // 배열 슬라이스
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // 런타임 변수 known_at_runtime_zero를 이용해 포인터를 슬라이스로 변환한다
    std.debug.print("배열 nums = {}\n", .{utils.fmt.slice(nums)});

    // 임의 접근
    const randomNum = randomAccess(nums);
    std.debug.print("nums에서 가져온 무작위 원소: {}\n", .{randomNum});

    // 메모리 할당자 초기화
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // 길이 확장
    nums = try extend(allocator, nums, 3);
    std.debug.print("배열의 길이를 8로 확장한 후 nums = {}\n", .{utils.fmt.slice(nums)});

    // 원소 삽입
    insert(nums, 6, 3);
    std.debug.print("인덱스 3에 숫자 6을 삽입한 후 nums = {}\n", .{utils.fmt.slice(nums)});

    // 원소 삭제
    remove(nums, 2);
    std.debug.print("인덱스 2의 원소를 삭제한 후 nums = {}\n", .{utils.fmt.slice(nums)});

    // 배열 순회
    traverse(nums);

    // 원소 탐색
    const index = find(nums, 3);
    std.debug.print("nums에서 찾은 원소 3의 인덱스 = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
