// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 雙向鏈結串列節點
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // 節點值
        next: ?*Self = null,    // 後繼節點指標
        prev: ?*Self = null,    // 前驅節點指標

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// 基於雙向鏈結串列實現的雙向佇列
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // 頭節點 front
        rear: ?*ListNode(T) = null,                     // 尾節點 rear
        que_size: usize = 0,                             // 雙向佇列的長度
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 記憶體分配器

        // 建構子（分配記憶體+初始化佇列）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // 析構函式（釋放記憶體）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 獲取雙向佇列的長度
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 判斷雙向佇列是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 入列操作
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // 若鏈結串列為空，則令 front 和 rear 都指向 node
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // 佇列首入列操作
            } else if (is_front) {
                // 將 node 新增至鏈結串列頭部
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // 更新頭節點
            // 佇列尾入列操作
            } else {
                // 將 node 新增至鏈結串列尾部
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // 更新尾節點
            }
            self.que_size += 1;      // 更新佇列長度
        } 

        // 佇列首入列
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // 佇列尾入列
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // 出列操作
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("雙向佇列為空");
            var val: T = undefined;
            // 佇列首出列操作
            if (is_front) {
                val = self.front.?.val;     // 暫存頭節點值
                // 刪除頭節點
                var fNext = self.front.?.next;
                if (fNext != null) {
                    fNext.?.prev = null;
                    self.front.?.next = null;
                }
                self.front = fNext;         // 更新頭節點
            // 佇列尾出列操作
            } else {
                val = self.rear.?.val;      // 暫存尾節點值
                // 刪除尾節點
                var rPrev = self.rear.?.prev;
                if (rPrev != null) {
                    rPrev.?.next = null;
                    self.rear.?.prev = null;
                }
                self.rear = rPrev;          // 更新尾節點
            }
            self.que_size -= 1;              // 更新佇列長度
            return val;
        } 

        // 佇列首出列
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // 佇列尾出列
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // 訪問佇列首元素
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("雙向佇列為空");
            return self.front.?.val;
        }  

        // 訪問佇列尾元素
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("雙向佇列為空");
            return self.rear.?.val;
        }

        // 返回陣列用於列印
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
    // 初始化雙向佇列
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("雙向佇列 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 訪問元素
    var peek_first = deque.peekFirst();
    std.debug.print("\n佇列首元素 peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\n佇列尾元素 peek_last = {}", .{peek_last});

    // 元素入列
    try deque.pushLast(4);
    std.debug.print("\n元素 4 佇列尾入列後 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\n元素 1 佇列首入列後 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 元素出列
    var pop_last = deque.popLast();
    std.debug.print("\n佇列尾出列元素 = {}，佇列尾出列後 deque = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\n佇列首出列元素 = {}，佇列首出列後 deque = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 獲取雙向佇列的長度
    var size = deque.size();
    std.debug.print("\n雙向佇列長度 size = {}", .{size});

    // 判斷雙向佇列是否為空
    var is_empty = deque.isEmpty();
    std.debug.print("\n雙向佇列是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
