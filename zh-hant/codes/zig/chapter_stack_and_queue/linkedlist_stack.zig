// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基於鏈結串列實現的堆疊
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // 將頭節點作為堆疊頂
        stk_size: usize = 0,                             // 堆疊的長度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // 記憶體分配器

        // 建構子（分配記憶體+初始化堆疊）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // 析構函式（釋放記憶體）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 獲取堆疊的長度
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // 判斷堆疊是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 訪問堆疊頂元素
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("堆疊為空");
            return self.stack_top.?.val;
        }  

        // 入堆疊
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // 出堆疊
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // 將堆疊轉換為陣列
        pub fn toArray(self: *Self) ![]T {
            var node = self.stack_top;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[res.len - i - 1] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化堆疊
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer stack.deinit();

    // 元素入堆疊
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("堆疊 stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 訪問堆疊頂元素
    var peek = stack.peek();
    std.debug.print("\n堆疊頂元素 top = {}", .{peek});

    // 元素出堆疊
    var pop = stack.pop();
    std.debug.print("\n出堆疊元素 pop = {}，出堆疊後 stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 獲取堆疊的長度
    var size = stack.size();
    std.debug.print("\n堆疊的長度 size = {}", .{size});

    // 判斷堆疊是否為空
    var is_empty = stack.isEmpty();
    std.debug.print("\n堆疊是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

