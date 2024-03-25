// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 基於環形陣列實現的佇列
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // 用於儲存佇列元素的陣列     
        cap: usize = 0,                                 // 佇列容量
        front: usize = 0,                               // 佇列首指標，指向佇列首元素
        queSize: usize = 0,                             // 尾指標，指向佇列尾 + 1
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 記憶體分配器

        // 建構子（分配記憶體+初始化陣列）
        pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.cap = cap;
            self.nums = try self.mem_allocator.alloc(T, self.cap);
            @memset(self.nums, @as(T, 0));
        }
        
        // 析構函式（釋放記憶體）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 獲取佇列的容量
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // 獲取佇列的長度
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // 判斷佇列是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // 入列
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("佇列已滿\n", .{});
                return;
            }
            // 計算佇列尾指標，指向佇列尾索引 + 1
            // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
            var rear = (self.front + self.queSize) % self.capacity();
            // 在尾節點後新增 num
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // 出列
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // 訪問佇列首元素
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("佇列為空");
            return self.nums[self.front];
        } 

        // 返回陣列
        pub fn toArray(self: *Self) ![]T {
            // 僅轉換有效長度範圍內的串列元素
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            var j: usize = self.front;
            while (i < self.size()) : ({ i += 1; j += 1; }) {
                res[i] = self.nums[j % self.capacity()];
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化佇列
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
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

    // 測試環形陣列
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\n第 {} 輪入列 + 出列後 queue = ", .{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
