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
    try heap.add(val);  //Push an element onto the heap
    std.debug.print("\nAfter pushing {} onto the heap\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    //Pop the top element from the heap
    std.debug.print("\nAfter popping the top element {}\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// Driver code
pub fn main() !void {
    // Initialize the allocator
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Initialize the heap
    // Initialize a min heap
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var min_heap = PQlt.init(std.heap.page_allocator, {});
    defer min_heap.deinit();
    // Initialize a max heap
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var max_heap = PQgt.init(std.heap.page_allocator, {});
    defer max_heap.deinit();

    std.debug.print("\nThe following example uses a max heap", .{});

    // Push an element onto the heap
    try testPush(i32, mem_allocator, &max_heap, 1);
    try testPush(i32, mem_allocator, &max_heap, 3);
    try testPush(i32, mem_allocator, &max_heap, 2);
    try testPush(i32, mem_allocator, &max_heap, 5);
    try testPush(i32, mem_allocator, &max_heap, 4);

    // Get the top element of the heap
    var peek = max_heap.peek().?;
    std.debug.print("\nHeap top = {}\n", .{peek});

    // Pop the top element from the heap
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);

    // Get the heap size
    var size = max_heap.len;
    std.debug.print("\nNumber of heap elements = {}\n", .{size});

    // Check whether the heap is empty
    var is_empty = if (max_heap.len == 0) true else false;
    std.debug.print("\nIs the heap empty? {}\n", .{is_empty});

    // Build a heap from an input list
    try min_heap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\nAfter building a min heap from the input list\n", .{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, min_heap);

    _ = try std.io.getStdIn().reader().readByte();
}