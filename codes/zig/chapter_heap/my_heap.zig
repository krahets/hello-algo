// File: my_heap.zig
// Created Time: 2023-01-14
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 堆类简易实现
// 编译期泛型
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        maxHeap: ?std.ArrayList(T) = null,      // 使用列表而非数组，这样无需考虑扩容问题

        // 构造函数，根据输入列表建堆
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.maxHeap != null) return;
            self.maxHeap = std.ArrayList(T).init(allocator);
            // 将列表元素原封不动添加进堆
            try self.maxHeap.?.appendSlice(nums);
            // 堆化除叶结点以外的其他所有结点
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // 析构函数，释放内存
        pub fn deinit(self: *Self) void {
            if (self.maxHeap != null) self.maxHeap.?.deinit();
        }

        // 获取左子结点索引
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // 获取右子结点索引
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // 获取父结点索引
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // 向下整除
            return @divFloor(i - 1, 2);
        }

        // 交换元素
        fn swap(self: *Self, i: usize, j: usize) !void {
            var a = self.maxHeap.?.items[i];
            var b = self.maxHeap.?.items[j];
            var tmp = a;
            try self.maxHeap.?.replaceRange(i, 1, &[_]T{b});
            try self.maxHeap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // 获取堆大小
        pub fn size(self: *Self) usize {
            return self.maxHeap.?.items.len;
        }

        // 判断堆是否为空
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 访问堆顶元素
        pub fn peek(self: *Self) T {
            return self.maxHeap.?.items[0];
        }  

        // 元素入堆
        pub fn push(self: *Self, val: T) !void {
            // 添加结点
            try self.maxHeap.?.append(val);
            // 从底至顶堆化
            try self.siftUp(self.size() - 1);
        }  

        // 从结点 i 开始，从底至顶堆化
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 获取结点 i 的父结点
                var p = parent(i);
                // 当“越过根结点”或“结点无需修复”时，结束堆化
                if (p < 0 or self.maxHeap.?.items[i] <= self.maxHeap.?.items[p]) break;
                // 交换两结点
                try self.swap(i, p);
                // 循环向上堆化
                i = p;
            }
        }

        // 元素出堆
        pub fn poll(self: *Self) !T {
            // 判断处理
            if (self.isEmpty()) unreachable;
            // 交换根结点与最右叶结点（即交换首元素与尾元素）
            try self.swap(0, self.size() - 1);
            // 删除结点
            var val = self.maxHeap.?.pop();
            // 从顶至底堆化
            try self.siftDown(0);
            // 返回堆顶元素
            return val;
        } 

        // 从结点 i 开始，从顶至底堆化
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // 判断结点 i, l, r 中值最大的结点，记为 ma
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.maxHeap.?.items[l] > self.maxHeap.?.items[ma]) ma = l;
                if (r < self.size() and self.maxHeap.?.items[r] > self.maxHeap.?.items[ma]) ma = r;
                // 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
                if (ma == i) break;
                // 交换两结点
                try self.swap(i, ma);
                // 循环向下堆化
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

        // 打印堆（二叉树）
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.maxHeap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// Driver Code
pub fn main() !void {
    // 初始化内存分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化大顶堆
    var maxHeap = MaxHeap(i32){};
    try maxHeap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer maxHeap.deinit();
    std.debug.print("\n输入列表并建堆后\n", .{});
    try maxHeap.print(mem_allocator);

    // 获取堆顶元素
    var peek = maxHeap.peek();
    std.debug.print("\n堆顶元素为 {}\n", .{peek});

    // 元素入堆
    const val = 7;
    try maxHeap.push(val);
    std.debug.print("\n元素 {} 入堆后\n", .{val});
    try maxHeap.print(mem_allocator);

    // 堆顶元素出堆
    peek = try maxHeap.poll();
    std.debug.print("\n堆顶元素 {} 出堆后\n", .{peek});
    try maxHeap.print(mem_allocator);

    // 获取堆的大小
    var size = maxHeap.size();
    std.debug.print("\n堆元素数量为 {}", .{size});

    // 判断堆是否为空
    var isEmpty = maxHeap.isEmpty();
    std.debug.print("\n堆是否为空 {}\n", .{isEmpty});

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

