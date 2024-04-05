// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化堆疊
    // 在 zig 中，推薦將 ArrayList 當作堆疊來使用
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer stack.deinit();

    // 元素入堆疊
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("堆疊 stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // 訪問堆疊頂元素
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\n堆疊頂元素 peek = {}", .{peek});

    // 元素出堆疊
    var pop = stack.pop();
    std.debug.print("\n出堆疊元素 pop = {}，出堆疊後 stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // 獲取堆疊的長度
    var size = stack.items.len;
    std.debug.print("\n堆疊的長度 size = {}", .{size});

    // 判斷堆疊是否為空
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\n堆疊是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
