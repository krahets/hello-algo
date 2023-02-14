// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 双向链表结点
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // 结点值
        next: ?*Self = null,    // 后继结点引用（指针）
        prev: ?*Self = null,    // 前驱结点引用（指针）

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

        front: ?*ListNode(T) = null,                    // 头结点 front
        rear: ?*ListNode(T) = null,                     // 尾结点 rear
        deqSize: usize = 0,                             // 双向队列的长度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

        // 构造方法（分配内存+初始化队列）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.deqSize = 0;
        }

        // 析构方法（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取双向队列的长度
        pub fn size(self: *Self) usize {
            return self.deqSize;
        }

        // 判断双向队列是否为空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 入队操作
        pub fn push(self: *Self, num: T, isFront: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // 若链表为空，则令 front, rear 都指向 node
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // 队首入队操作
            } else if (isFront) {
                // 将 node 添加至链表头部
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // 更新头结点
            // 队尾入队操作
            } else {
                // 将 node 添加至链表尾部
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // 更新尾结点
            }
            self.deqSize += 1;      // 更新队列长度
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
        pub fn poll(self: *Self, isFront: bool) T {
            if (self.isEmpty()) @panic("双向队列为空");
            var val: T = undefined;
            // 队首出队操作
            if (isFront) {
                val = self.front.?.val;     // 暂存头结点值
                // 删除头结点
                var fNext = self.front.?.next;
                if (fNext != null) {
                    fNext.?.prev = null;
                    self.front.?.next = null;
                }
                self.front = fNext;         // 更新头结点
            // 队尾出队操作
            } else {
                val = self.rear.?.val;      // 暂存尾结点值
                // 删除尾结点
                var rPrev = self.rear.?.prev;
                if (rPrev != null) {
                    rPrev.?.next = null;
                    self.rear.?.prev = null;
                }
                self.rear = rPrev;          // 更新尾结点
            }
            self.deqSize -= 1;              // 更新队列长度
            return val;
        } 

        // 队首出队
        pub fn pollFirst(self: *Self) T {
            return self.poll(true);
        } 

        // 队尾出队
        pub fn pollLast(self: *Self) T {
            return self.poll(false);
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

        // 将链表转换为数组
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            std.mem.set(T, res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }

        // 打印双向队列
        pub fn print(self: *Self) !void {
            var nums = try self.toArray();
            std.debug.print("[", .{});
            if (nums.len > 0) {
                for (nums) |num, j| {
                    std.debug.print("{}{s}", .{num, if (j == nums.len - 1) "]" else " <-> " });
                }
            } else {
                std.debug.print("]", .{});
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化双向队列
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    std.debug.print("初始化空队列\n", .{});
    try deque.print();

    var nums = [_]i32{ 1, 2, 3};    // 测试数据

    // 队尾入队
    for (nums) |num| {
        try deque.pushLast(num);
        std.debug.print("\n元素 {} 队尾入队后，队列为\n", .{num});
        try deque.print();
    }
    // 获取队尾元素
    var last = deque.peekLast();
    std.debug.print("\n队尾元素为 {}", .{last});
    // 队尾出队
    while (!deque.isEmpty()) {
        last = deque.pollLast();
        std.debug.print("\n队尾出队元素为 {} ，队列为\n", .{last});
        try deque.print();
    }

    // 队首入队
    for (nums) |num| {
        try deque.pushFirst(num);
        std.debug.print("\n元素 {} 队首入队后，队列为\n", .{num});
        try deque.print();
    }
    // 获取队首元素
    var first = deque.peekFirst();
    std.debug.print("\n队首元素为 {}", .{first});
    // 队首出队
    while (!deque.isEmpty()) {
        first = deque.pollFirst();
        std.debug.print("\n队首出队元素为 {} ，队列为\n", .{first});
        try deque.print();
    }

    // 获取队列的长度
    var size = deque.size();
    std.debug.print("\n队列长度 size = {}", .{size});

    // 判断双向队列是否为空
    var is_empty = deque.isEmpty();
    std.debug.print("\n双向队列是否为空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
