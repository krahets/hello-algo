// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 列表类
pub fn MyList(comptime T: type) type {
    return struct {
        const Self = @This();
        
        arr: []T = undefined,                        // 数组（存储列表元素）
        arrCapacity: usize = 10,                     // 列表容量
        numSize: usize = 0,                           // 列表长度（当前元素数量）
        extendRatio: usize = 2,                       // 每次列表扩容的倍数
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined, // 内存分配器

        // 构造函数（分配内存+初始化列表）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.arr = try self.mem_allocator.alloc(T, self.arrCapacity);
            @memset(self.arr, @as(T, 0));
        }

        // 析构函数（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取列表长度（当前元素数量）
        pub fn size(self: *Self) usize {
            return self.numSize;
        }

        // 获取列表容量
        pub fn capacity(self: *Self) usize {
            return self.arrCapacity;
        }

        // 访问元素
        pub fn get(self: *Self, index: usize) T {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            return self.arr[index];
        }  

        // 更新元素
        pub fn set(self: *Self, index: usize, num: T) void {
            // 索引如果越界，则抛出异常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            self.arr[index] = num;
        }  

        // 在尾部添加元素
        pub fn add(self: *Self, num: T) !void {
            // 元素数量超出容量时，触发扩容机制
            if (self.size() == self.capacity()) try self.extendCapacity();
            self.arr[self.size()] = num;
            // 更新元素数量
            self.numSize += 1;
        }  

        // 在中间插入元素
        pub fn insert(self: *Self, index: usize, num: T) !void {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (self.size() == self.capacity()) try self.extendCapacity();
            // 将索引 index 以及之后的元素都向后移动一位
            var j = self.size() - 1;
            while (j >= index) : (j -= 1) {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 更新元素数量
            self.numSize += 1;
        }

        // 删除元素
        pub fn remove(self: *Self, index: usize) T {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            var num = self.arr[index];
            // 将索引 index 之后的元素都向前移动一位
            var j = index;
            while (j < self.size() - 1) : (j += 1) {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素数量
            self.numSize -= 1;
            // 返回被删除的元素
            return num;
        }

        // 列表扩容
        pub fn extendCapacity(self: *Self) !void {
            // 新建一个长度为 size * extendRatio 的数组，并将原数组复制到新数组
            var newCapacity = self.capacity() * self.extendRatio;
            var extend = try self.mem_allocator.alloc(T, newCapacity);
            @memset(extend, @as(T, 0));
            // 将原数组中的所有元素复制到新数组
            std.mem.copy(T, extend, self.arr);
            self.arr = extend;
            // 更新列表容量
            self.arrCapacity = newCapacity;
        }

        // 将列表转换为数组
        pub fn toArray(self: *Self) ![]T {
            // 仅转换有效长度范围内的列表元素
            var arr = try self.mem_allocator.alloc(T, self.size());
           @memset(arr, @as(T, 0));
            for (arr, 0..) |*num, i| {
                num.* = self.get(i);
            }
            return arr;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化列表
    var nums = MyList(i32){};
    try nums.init(std.heap.page_allocator);
    // 延迟释放内存
    defer nums.deinit();

    // 在尾部添加元素
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("列表 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());
    std.debug.print(" ，容量 = {} ，长度 = {}", .{nums.capacity(), nums.size()});

    // 在中间插入元素
    try nums.insert(3, 6);
    std.debug.print("\n在索引 3 处插入数字 6 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 删除元素
    _ = nums.remove(3);
    std.debug.print("\n删除索引 3 处的元素，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 访问元素
    var num = nums.get(1);
    std.debug.print("\n访问索引 1 处的元素，得到 num = {}", .{num});

    // 更新元素
    nums.set(1, 0);
    std.debug.print("\n将索引 1 处的元素更新为 0 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 测试扩容机制
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        try nums.add(i);
    }
    std.debug.print("\n扩容后的列表 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());
    std.debug.print(" ，容量 = {} ，长度 = {}\n", .{nums.capacity(), nums.size()});

    _ = try std.io.getStdIn().reader().readByte();
}
