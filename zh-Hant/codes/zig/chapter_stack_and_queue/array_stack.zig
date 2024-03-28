// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基於陣列實現的堆疊
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // 建構子（分配記憶體+初始化堆疊）
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // 析構方法（釋放記憶體）
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // 獲取堆疊的長度
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // 判斷堆疊是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 訪問堆疊頂元素
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("堆疊為空");
            return self.stack.?.items[self.size() - 1];
        }  

        // 入堆疊
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // 出堆疊
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // 返回 ArrayList
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化堆疊
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer stack.deinit();

    // 元素入堆疊
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("堆疊 stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // 訪問堆疊頂元素
    var peek = stack.peek();
    std.debug.print("\n堆疊頂元素 peek = {}", .{peek});

    // 元素出堆疊
    var top = stack.pop();
    std.debug.print("\n出堆疊元素 pop = {}，出堆疊後 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // 獲取堆疊的長度
    var size = stack.size();
    std.debug.print("\n堆疊的長度 size = {}", .{size});

    // 判斷堆疊是否為空
    var is_empty = stack.isEmpty();
    std.debug.print("\n堆疊是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
