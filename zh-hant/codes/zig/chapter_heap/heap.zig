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
    try heap.add(val);  //元素入堆積
    std.debug.print("\n元素 {} 入堆積後\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    //堆積頂元素出堆積
    std.debug.print("\n堆積頂元素 {} 出堆積後\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// Driver Code
pub fn main() !void {
    // 初始化記憶體分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化堆積
    // 初始化小頂堆積
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var min_heap = PQlt.init(std.heap.page_allocator, {});
    defer min_heap.deinit();
    // 初始化大頂堆積
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var max_heap = PQgt.init(std.heap.page_allocator, {});
    defer max_heap.deinit();

    std.debug.print("\n以下測試樣例為大頂堆積", .{});

    // 元素入堆積
    try testPush(i32, mem_allocator, &max_heap, 1);
    try testPush(i32, mem_allocator, &max_heap, 3);
    try testPush(i32, mem_allocator, &max_heap, 2);
    try testPush(i32, mem_allocator, &max_heap, 5);
    try testPush(i32, mem_allocator, &max_heap, 4);

    // 獲取堆積頂元素
    var peek = max_heap.peek().?;
    std.debug.print("\n堆積頂元素為 {}\n", .{peek});

    // 堆積頂元素出堆積
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);

    // 獲取堆積的大小
    var size = max_heap.len;
    std.debug.print("\n堆積元素數量為 {}\n", .{size});

    // 判斷堆積是否為空
    var is_empty = if (max_heap.len == 0) true else false;
    std.debug.print("\n堆積是否為空 {}\n", .{is_empty});

    // 輸入串列並建堆積
    try min_heap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\n輸入串列並建立小頂堆積後\n", .{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, min_heap);

    _ = try std.io.getStdIn().reader().readByte();
}