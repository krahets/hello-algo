// File: my_heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 堆積類別簡易實現
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        max_heap: ?std.ArrayList(T) = null,      // 使用串列而非陣列，這樣無須考慮擴容問題

        // 建構子，根據輸入串列建堆積
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.max_heap != null) return;
            self.max_heap = std.ArrayList(T).init(allocator);
            // 將串列元素原封不動新增進堆積
            try self.max_heap.?.appendSlice(nums);
            // 堆積化除葉節點以外的其他所有節點
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // 析構方法，釋放記憶體
        pub fn deinit(self: *Self) void {
            if (self.max_heap != null) self.max_heap.?.deinit();
        }

        // 獲取左子節點的索引
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // 獲取右子節點的索引
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // 獲取父節點的索引
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // 向下整除
            return @divFloor(i - 1, 2);
        }

        // 交換元素
        fn swap(self: *Self, i: usize, j: usize) !void {
            var tmp = self.max_heap.?.items[i];
            try self.max_heap.?.replaceRange(i, 1, &[_]T{self.max_heap.?.items[j]});
            try self.max_heap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // 獲取堆積大小
        pub fn size(self: *Self) usize {
            return self.max_heap.?.items.len;
        }

        // 判斷堆積是否為空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 訪問堆積頂元素
        pub fn peek(self: *Self) T {
            return self.max_heap.?.items[0];
        }  

        // 元素入堆積
        pub fn push(self: *Self, val: T) !void {
            // 新增節點
            try self.max_heap.?.append(val);
            // 從底至頂堆積化
            try self.siftUp(self.size() - 1);
        }  

        // 從節點 i 開始，從底至頂堆積化
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 獲取節點 i 的父節點
                var p = parent(i);
                // 當“越過根節點”或“節點無須修復”時，結束堆積化
                if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
                // 交換兩節點
                try self.swap(i, p);
                // 迴圈向上堆積化
                i = p;
            }
        }

        // 元素出堆積
        pub fn pop(self: *Self) !T {
            // 判斷處理
            if (self.isEmpty()) unreachable;
            // 交換根節點與最右葉節點（交換首元素與尾元素）
            try self.swap(0, self.size() - 1);
            // 刪除節點
            var val = self.max_heap.?.pop();
            // 從頂至底堆積化
            try self.siftDown(0);
            // 返回堆積頂元素
            return val;
        } 

        // 從節點 i 開始，從頂至底堆積化
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 判斷節點 i, l, r 中值最大的節點，記為 ma
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
                if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
                // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
                if (ma == i) break;
                // 交換兩節點
                try self.swap(i, ma);
                // 迴圈向下堆積化
                i = ma;
            }
        }

        fn lessThan(context: void, a: T, b: T) std.math.Order {
            _ = context;
            return std.math.order(a, b);
        }

        fn greaterThan(context: void, a: T, b: T) std.math.Order {
            return lessThan(context, a, b).invert();
        }

        // 列印堆積（二元樹）
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.max_heap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// Driver Code
pub fn main() !void {
    // 初始化記憶體分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化大頂堆積
    var max_heap = MaxHeap(i32){};
    try max_heap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer max_heap.deinit();
    std.debug.print("\n輸入串列並建堆積後\n", .{});
    try max_heap.print(mem_allocator);

    // 獲取堆積頂元素
    var peek = max_heap.peek();
    std.debug.print("\n堆積頂元素為 {}\n", .{peek});

    // 元素入堆積
    const val = 7;
    try max_heap.push(val);
    std.debug.print("\n元素 {} 入堆積後\n", .{val});
    try max_heap.print(mem_allocator);

    // 堆積頂元素出堆積
    peek = try max_heap.pop();
    std.debug.print("\n堆積頂元素 {} 出堆積後\n", .{peek});
    try max_heap.print(mem_allocator);

    // 獲取堆積的大小
    var size = max_heap.size();
    std.debug.print("\n堆積元素數量為 {}", .{size});

    // 判斷堆積是否為空
    var is_empty = max_heap.isEmpty();
    std.debug.print("\n堆積是否為空 {}\n", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

