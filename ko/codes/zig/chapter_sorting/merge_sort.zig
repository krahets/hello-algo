// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 왼쪽 부분 배열과 오른쪽 부분 배열 병합
// 왼쪽 부분 배열의 구간 [left, mid]
// 오른쪽 부분 배열의 구간 [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // 보조 배열 초기화
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // 왼쪽 부분 배열의 시작 인덱스와 끝 인덱스
    var leftStart = left - left;
    var leftEnd = mid - left;
    // 오른쪽 부분 배열의 시작 인덱스와 끝 인덱스
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i와 j는 각각 왼쪽 부분 배열과 오른쪽 부분 배열의 첫 원소를 가리킨다
    var i = leftStart;
    var j = rightStart;
    // 원본 배열 nums에 덮어쓰면서 왼쪽 부분 배열과 오른쪽 부분 배열을 병합한다
    var k = left;
    while (k <= right) : (k += 1) {
        // 왼쪽 부분 배열의 병합이 모두 끝났다면 오른쪽 부분 배열의 원소를 선택하고 j++를 수행한다
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // 그렇지 않고 오른쪽 부분 배열의 병합이 모두 끝났거나 왼쪽 부분 배열의 원소 <= 오른쪽 부분 배열의 원소라면 왼쪽 부분 배열의 원소를 선택하고 i++를 수행한다
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // 그렇지 않고 양쪽 부분 배열 모두 병합이 끝나지 않았으며 왼쪽 부분 배열의 원소 > 오른쪽 부분 배열의 원소라면 오른쪽 부분 배열의 원소를 선택하고 j++를 수행한다
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// 병합 정렬
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // 종료 조건
    if (left >= right) return;              // 부분 배열의 길이가 1이면 재귀를 종료한다
    // 분할 단계
    var mid = left + (right - left) / 2;    // 중간 위치를 계산한다
    try mergeSort(nums, left, mid);         // 왼쪽 부분 배열에 재귀 호출한다
    try mergeSort(nums, mid + 1, right);    // 오른쪽 부분 배열에 재귀 호출한다
    // 병합 단계
    try merge(nums, left, mid, right);
}

// 실행 코드
pub fn main() !void {
    // 병합 정렬
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("병합 정렬을 마친 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
