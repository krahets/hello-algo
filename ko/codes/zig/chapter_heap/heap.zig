// File: heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

fn lessThan(context: void, a: i32, b: i32) std.math.Order {
    _ = context;
    return std.math.order(a, b);
}

fn greaterThan(context: void, a: i32, b: i32) std.math.Order {
    return lessThan(context, a, b).invert();
}

fn testPush(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype, val: T) !void {
    try heap.add(val);  //힙에 원소 삽입
    std.debug.print("\n원소 {} 삽입 후의 힙\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    //힙의 루트 원소 꺼내기
    std.debug.print("\n루트 원소 {} 삭제 후의 힙\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// 실행 코드
pub fn main() !void {
    // 메모리 할당자 초기화
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 힙 초기화
    // 최소 힙 초기화
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var min_heap = PQlt.init(std.heap.page_allocator, {});
    defer min_heap.deinit();
    // 최대 힙 초기화
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var max_heap = PQgt.init(std.heap.page_allocator, {});
    defer max_heap.deinit();

    std.debug.print("\n다음 테스트 예제는 최대 힙이다", .{});

    // 힙에 원소 삽입
    try testPush(i32, mem_allocator, &max_heap, 1);
    try testPush(i32, mem_allocator, &max_heap, 3);
    try testPush(i32, mem_allocator, &max_heap, 2);
    try testPush(i32, mem_allocator, &max_heap, 5);
    try testPush(i32, mem_allocator, &max_heap, 4);

    // 힙의 루트 원소 반환
    var peek = max_heap.peek().?;
    std.debug.print("\n힙의 루트 원소: {}\n", .{peek});

    // 힙의 루트 원소 꺼내기
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);

    // 힙의 크기 조회
    var size = max_heap.len;
    std.debug.print("\n힙의 원소 개수: {}\n", .{size});

    // 힙이 비어 있는지 판단
    var is_empty = if (max_heap.len == 0) true else false;
    std.debug.print("\n힙이 비어 있는가: {}\n", .{is_empty});

    // 리스트를 입력하여 힙 구성
    try min_heap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\n리스트를 입력하고 최소 힙을 구성한 후\n", .{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, min_heap);

    _ = try std.io.getStdIn().reader().readByte();
}