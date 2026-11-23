// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 실행 코드
pub fn run() !void {
    // 리스트 초기화
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // 메모리 해제를 지연한다

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("리스트 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 원소 접근
    const num = nums.items[1];
    std.debug.print("인덱스 1의 원소에 접근하여 얻은 num = {}\n", .{num});

    // 원소 갱신
    nums.items[1] = 0;
    std.debug.print("인덱스 1의 원소를 0으로 갱신한 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 리스트 비우기
    nums.clearRetainingCapacity();
    std.debug.print("리스트를 비운 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 맨 뒤에 원소 추가
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("원소를 추가한 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 중간에 원소 삽입
    try nums.insert(3, 6);
    std.debug.print("인덱스 3에 숫자 6을 삽입한 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 원소 삭제
    _ = nums.orderedRemove(3);
    std.debug.print("인덱스 3의 원소를 삭제한 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 인덱스를 통해 리스트를 순회한다
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // 리스트의 원소를 직접 순회한다
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // 두 리스트 연결
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("리스트 nums1을 nums 뒤에 이어 붙인 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    // 리스트 정렬
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("리스트를 정렬한 후 nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
