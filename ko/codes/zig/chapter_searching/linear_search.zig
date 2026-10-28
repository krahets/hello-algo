// File: linear_search.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 선형 탐색(배열)
fn linearSearchArray(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 배열 순회
    for (nums.items, 0..) |num, i| {
        // 목표 원소를 찾으면 해당 인덱스를 반환한다
        if (num == target) {
            return @intCast(i);
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1;
}

// 선형 탐색(연결 리스트)
pub fn linearSearchLinkedList(comptime T: type, node: ?*inc.ListNode(T), target: T) ?*inc.ListNode(T) {
    var head = node;
    // 연결 리스트 순회
    while (head != null) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다
        if (head.?.val == target) return head;
        head = head.?.next;
    }
    return null;
}

// 실행 코드
pub fn main() !void {
    var target: i32 = 3;

    // 배열에서 선형 탐색을 수행한다
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 });
    var index = linearSearchArray(i32, nums, target);
    std.debug.print("목표 원소 3의 인덱스 = {}\n", .{index});

    // 연결 리스트에서 선형 탐색을 수행한다
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.listToLinkedList(i32, mem_allocator, nums);
    var node = linearSearchLinkedList(i32, head, target);
    std.debug.print("목표 노드 값 3에 해당하는 노드 객체 ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}