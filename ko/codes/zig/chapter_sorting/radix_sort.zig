// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 원소 num의 k번째 자릿값 반환. 이때 exp = 10^(k-1)이다
fn digit(num: i32, exp: i32) i32 {
    // k 대신 exp를 전달하면 여기서 비용이 큰 거듭제곱 계산을 반복하지 않아도 된다
    return @mod(@divFloor(num, exp), 10);
}

// 계수 정렬(nums의 k번째 자릿값을 기준으로 정렬)
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // 십진수의 각 자리는 0~9 범위이므로 길이가 10인 버킷 배열이 필요하다
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // 0~9 각 숫자의 등장 횟수를 센다
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // nums[i]의 k번째 자릿값을 구하여 d로 표시한다
        counter[d] += 1; // 숫자 d의 등장 횟수를 센다
    }
    // 접두 합을 구하여 등장 개수를 배열 인덱스로 변환한다
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // 역순으로 순회하며 버킷에 집계된 결과에 따라 각 원소를 res에 채운다
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // 배열에서 d의 인덱스 j를 구한다
        res[j] = nums[i];       // 현재 원소를 인덱스 j에 채운다
        counter[d] -= 1;        // d의 개수를 1 줄인다
        if (i == 0) break;
    }
    // 결과로 원래 배열 nums를 덮어쓴다
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = res[i];
    }
}

// 기수 정렬
fn radixSort(nums: []i32) !void {
    // 배열의 최댓값을 구하여 최대 자릿수를 판단한다
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // 낮은 자리에서 높은 자리 순서로 순회한다
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // 배열 원소의 k번째 자릿값에 대해 계수 정렬을 수행한다
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 즉, exp = 10^(k-1)이다
        try countingSortDigit(nums, exp);    
    }
} 

// 실행 코드
pub fn main() !void {
    // 기수 정렬
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("기수 정렬을 마친 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}