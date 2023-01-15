// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基于链表实现的栈
// 编译期泛型
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stackTop: ?*inc.ListNode(T) = null,             // 将头结点作为栈顶
        stkSize: usize = 0,                             // 栈的长度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

        // 构造函数（分配内存+初始化栈）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stackTop = null;
            self.stkSize = 0;
        }

        // 析构函数（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取栈的长度
        pub fn size(self: *Self) usize {
            return self.stkSize;
        }

        // 判断栈是否为空
        pub fn empty(self: *Self) bool {
            return self.size() == 0;
        }

        // 访问栈顶元素
        pub fn top(self: *Self) T {
            if (self.size() == 0) @panic("栈为空");
            return self.stackTop.?.val;
        }  

        // 入栈
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stackTop;
            self.stackTop = node;
            self.stkSize += 1;
        } 

        // 出栈
        pub fn pop(self: *Self) T {
            var num = self.top();
            self.stackTop = self.stackTop.?.next;
            self.stkSize -= 1;
            return num;
        } 

        // 将栈转换为数组
        pub fn toArray(self: *Self) ![]T {
            var node = self.stackTop;
            var res = try self.mem_allocator.alloc(T, self.size());
            std.mem.set(T, res, @as(T, 0));
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
    var top = stack.top();
    std.debug.print("\n栈顶元素 top = {}", .{top});

    // 元素出栈
    top = stack.pop();
    std.debug.print("\n出栈元素 pop = {}，出栈后 stack = ", .{top});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 获取栈的长度
    var size = stack.size();
    std.debug.print("\n栈的长度 size = {}", .{size});

    // 判断栈是否为空
    var empty = stack.empty();
    std.debug.print("\n栈是否为空 = {}", .{empty});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

