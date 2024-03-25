// File: linkedlist_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基於鏈結串列實現的佇列
pub fn LinkedListQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*inc.ListNode(T) = null,                // 頭節點 front
        rear: ?*inc.ListNode(T) = null,                 // 尾節點 rear
        que_size: usize = 0,                            // 佇列的長度
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

        // 獲取佇列的長度
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 判斷佇列是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 訪問佇列首元素
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("佇列為空");
            return self.front.?.val;
        }  

        // 入列
        pub fn push(self: *Self, num: T) !void {
            // 在尾節點後新增 num
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            // 如果佇列為空，則令頭、尾節點都指向該節點
            if (self.front == null) {
                self.front = node;
                self.rear = node;
            // 如果佇列不為空，則將該節點新增到尾節點後
            } else {
                self.rear.?.next = node;
                self.rear = node;
            }
            self.que_size += 1;
        } 

        // 出列
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 刪除頭節點
            self.front = self.front.?.next;
            self.que_size -= 1;
            return num;
        } 

        // 將鏈結串列轉換為陣列
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
    // 初始化佇列
    var queue = LinkedListQueue(i32){};
    try queue.init(std.heap.page_allocator);
    defer queue.deinit();

    // 元素入列
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("佇列 queue = ", .{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // 訪問佇列首元素
    var peek = queue.peek();
    std.debug.print("\n佇列首元素 peek = {}", .{peek});

    // 元素出列
    var pop = queue.pop();
    std.debug.print("\n出列元素 pop = {}，出列後 queue = ", .{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // 獲取佇列的長度
    var size = queue.size();
    std.debug.print("\n佇列長度 size = {}", .{size});

    // 判斷佇列是否為空
    var is_empty = queue.isEmpty();
    std.debug.print("\n佇列是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
