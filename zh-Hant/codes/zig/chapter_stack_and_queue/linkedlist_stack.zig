// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基于链表实现的栈
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // 将头节点作为栈顶
        stk_size: usize = 0,                             // 栈的长度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // 内存分配器

        // 构造函数（分配内存+初始化栈）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // 析构函数（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取栈的长度
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // 判断栈是否为空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 访问栈顶元素
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("栈为空");
            return self.stack_top.?.val;
        }  

        // 入栈
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // 出栈
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // 将栈转换为数组
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
    // 初始化栈
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // 延迟释放内存
    defer stack.deinit();

    // 元素入栈
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("栈 stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 访问栈顶元素
    var peek = stack.peek();
    std.debug.print("\n栈顶元素 top = {}", .{peek});

    // 元素出栈
    var pop = stack.pop();
    std.debug.print("\n出栈元素 pop = {}，出栈后 stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 获取栈的长度
    var size = stack.size();
    std.debug.print("\n栈的长度 size = {}", .{size});

    // 判断栈是否为空
    var is_empty = stack.isEmpty();
    std.debug.print("\n栈是否为空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

