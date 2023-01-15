// File: heap.zig
// Created Time: 2023-01-14
// Author: sjinzh (sjinzh@gmail.com)

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
    try heap.add(val);  //元素入堆
    std.debug.print("\n元素 {} 入堆后\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    //堆顶元素出堆
    std.debug.print("\n堆顶元素 {} 出堆后\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// Driver Code
pub fn main() !void {
    // 初始化内存分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化堆
    // 初始化小顶堆
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var minHeap = PQlt.init(std.heap.page_allocator, {});
    defer minHeap.deinit();
    // 初始化大顶堆
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var maxHeap = PQgt.init(std.heap.page_allocator, {});
    defer maxHeap.deinit();

    std.debug.print("\n以下测试样例为大顶堆", .{});

    // 元素入堆
    try testPush(i32, mem_allocator, &maxHeap, 1);
    try testPush(i32, mem_allocator, &maxHeap, 3);
    try testPush(i32, mem_allocator, &maxHeap, 2);
    try testPush(i32, mem_allocator, &maxHeap, 5);
    try testPush(i32, mem_allocator, &maxHeap, 4);

    // 获取堆顶元素
    var peek = maxHeap.peek().?;
    std.debug.print("\n堆顶元素为 {}\n", .{peek});

    // 堆顶元素出堆
    try testPop(i32, mem_allocator, &maxHeap);
    try testPop(i32, mem_allocator, &maxHeap);
    try testPop(i32, mem_allocator, &maxHeap);
    try testPop(i32, mem_allocator, &maxHeap);
    try testPop(i32, mem_allocator, &maxHeap);

    // 获取堆的大小
    var size = maxHeap.len;
    std.debug.print("\n堆元素数量为 {}\n", .{size});

    // 判断堆是否为空
    var isEmpty = if (maxHeap.len == 0) true else false;
    std.debug.print("\n堆是否为空 {}\n", .{isEmpty});

    // 输入列表并建堆
    try minHeap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\n输入列表并建立小顶堆后\n", .{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, minHeap);

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}