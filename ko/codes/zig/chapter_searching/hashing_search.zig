// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 해시 탐색(배열)
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // 해시 테이블의 key: 목표 원소, value: 인덱스
    // 해시 테이블에 해당 key가 없으면 -1을 반환한다   
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// 해시 탐색(연결 리스트)
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
    // 해시 테이블에 해당 key가 없으면 null을 반환한다 
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// 실행 코드
pub fn main() !void {
    var target: i32 = 3;

    // 해시 탐색(배열)
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // 해시 테이블 초기화
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: 원소, value: 인덱스
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("목표 원소 3의 인덱스 = {}\n", .{index});

    // 해시 탐색(연결 리스트)
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // 해시 테이블 초기화
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("목표 노드 값 3에 해당하는 노드 객체 ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

