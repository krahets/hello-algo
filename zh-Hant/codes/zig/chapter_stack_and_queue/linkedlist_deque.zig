// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 双向链表节点
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // 节点值
        next: ?*Self = null,    // 后继节点指针
        prev: ?*Self = null,    // 前驱节点指针

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// 基于双向链表实现的双向队列
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // 头节点 front
        rear: ?*ListNode(T) = null,                     // 尾节点 rear
        que_size: usize = 0,                             // 双向队列的长度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

        // 构造函数（分配内存+初始化队列）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // 析构函数（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取双向队列的长度
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 判断双向队列是否为空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 入队操作
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // 若链表为空，则令 front 和 rear 都指向 node
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // 队首入队操作
            } else if (is_front) {
                // 将 node 添加至链表头部
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // 更新头节点
            // 队尾入队操作
            } else {
                // 将 node 添加至链表尾部
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // 更新尾节点
            }
            self.que_size += 1;      // 更新队列长度
        } 

        // 队首入队
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // 队尾入队
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // 出队操作
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("双向队列为空");
            var val: T = undefined;
            // 队首出队操作
            if (is_front) {
                val = self.front.?.val;     // 暂存头节点值
                // 删除头节点
                var fNext = self.front.?.next;
                if (fNext != null) {
                    fNext.?.prev = null;
                    self.front.?.next = null;
                }
                self.front = fNext;         // 更新头节点
            // 队尾出队操作
            } else {
                val = self.rear.?.val;      // 暂存尾节点值
                // 删除尾节点
                var rPrev = self.rear.?.prev;
                if (rPrev != null) {
                    rPrev.?.next = null;
                    self.rear.?.prev = null;
                }
                self.rear = rPrev;          // 更新尾节点
            }
            self.que_size -= 1;              // 更新队列长度
            return val;
        } 

        // 队首出队
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // 队尾出队
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // 访问队首元素
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("双向队列为空");
            return self.front.?.val;
        }  

        // 访问队尾元素
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("双向队列为空");
            return self.rear.?.val;
        }

        // 返回数组用于打印
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化双向队列
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("双向队列 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 访问元素
    var peek_first = deque.peekFirst();
    std.debug.print("\n队首元素 peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\n队尾元素 peek_last = {}", .{peek_last});

    // 元素入队
    try deque.pushLast(4);
    std.debug.print("\n元素 4 队尾入队后 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\n元素 1 队首入队后 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 元素出队
    var pop_last = deque.popLast();
    std.debug.print("\n队尾出队元素 = {}，队尾出队后 deque = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\n队首出队元素 = {}，队首出队后 deque = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 获取双向队列的长度
    var size = deque.size();
    std.debug.print("\n双向队列长度 size = {}", .{size});

    // 判断双向队列是否为空
    var is_empty = deque.isEmpty();
    std.debug.print("\n双向队列是否为空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
