// File: my_list.zig
// Created Time: 2023-01-08
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 列表类简易实现
pub fn MyList(comptime T: type) type {
    return struct {
        const Self = @This();
        
        nums: []T = undefined,                        // 数组（存储列表元素）
        nums_capacity: usize = 10,                     // 列表容量
        num_size: usize = 0,                           // 列表长度（即当前元素数量）
        extend_ratio: usize = 2,                       // 每次列表扩容的倍数
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined, // 内存分配器

        // 构造方法（分配内存+初始化列表）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.nums = try self.mem_allocator.alloc(T, self.nums_capacity);
            std.mem.set(T, self.nums, @as(T, 0));
        }

        // 析构方法（释放内存）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取列表长度（即当前元素数量）
        pub fn size(self: *Self) usize {
            return self.num_size;
        }

        // 获取列表容量
        pub fn capacity(self: *Self) usize {
            return self.nums_capacity;
        }

        // 访问元素
        pub fn get(self: *Self, index: usize) T {
            // 索引如果越界则抛出异常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            return self.nums[index];
        }  

        // 更新元素
        pub fn set(self: *Self, index: usize, num: T) void {
            // 索引如果越界则抛出异常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            self.nums[index] = num;
        }  

        // 尾部添加元素
        pub fn add(self: *Self, num: T) !void {
            // 元素数量超出容量时，触发扩容机制
            if (self.size() == self.capacity()) try self.extendCapacity();
            self.nums[self.size()] = num;
            // 更新元素数量
            self.num_size += 1;
        }  

        // 中间插入元素
        pub fn insert(self: *Self, index: usize, num: T) !void {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            // 元素数量超出容量时，触发扩容机制
            if (self.size() == self.capacity()) try self.extendCapacity();
            // 索引 i 以及之后的元素都向后移动一位
            var j = self.size() - 1;
            while (j >= index) : (j -= 1) {
                self.nums[j + 1] = self.nums[j];
            }
            self.nums[index] = num;
            // 更新元素数量
            self.num_size += 1;
        }

        // 删除元素
        pub fn remove(self: *Self, index: usize) T {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            var num = self.nums[index];
            // 索引 i 之后的元素都向前移动一位
            var j = index;
            while (j < self.size() - 1) : (j += 1) {
                self.nums[j] = self.nums[j + 1];
            }
            // 更新元素数量
            self.num_size -= 1;
            // 返回被删除元素
            return num;
        }

        // 列表扩容
        pub fn extendCapacity(self: *Self) !void {
            // 新建一个长度为 size * extend_ratio 的数组，并将原数组拷贝到新数组
            var newCapacity = self.capacity() * self.extend_ratio;
            var extend = try self.mem_allocator.alloc(T, newCapacity);
            std.mem.set(T, extend, @as(T, 0));
            // 将原数组中的所有元素复制到新数组
            std.mem.copy(T, extend, self.nums);
            self.nums = extend;
            // 更新列表容量
            self.nums_capacity = newCapacity;
        }

        // 将列表转换为数组
        pub fn toArray(self: *Self) ![]T {
            // 仅转换有效长度范围内的列表元素
            var nums = try self.mem_allocator.alloc(T, self.size());
            std.mem.set(T, nums, @as(T, 0));
            for (nums) |*num, i| {
                num.* = self.get(i);
            }
            return nums;
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化列表
    var list = MyList(i32){};
    try list.init(std.heap.page_allocator);
    // 延迟释放内存
    defer list.deinit();

    // 尾部添加元素
    try list.add(1);
    try list.add(3);
    try list.add(2);
    try list.add(5);
    try list.add(4);
    std.debug.print("列表 list = ", .{});
    inc.PrintUtil.printArray(i32, try list.toArray());
    std.debug.print(" ，容量 = {} ，长度 = {}", .{list.capacity(), list.size()});

    // 中间插入元素
    try list.insert(3, 6);
    std.debug.print("\n在索引 3 处插入数字 6 ，得到 list = ", .{});
    inc.PrintUtil.printArray(i32, try list.toArray());

    // 删除元素
    _ = list.remove(3);
    std.debug.print("\n删除索引 3 处的元素，得到 list = ", .{});
    inc.PrintUtil.printArray(i32, try list.toArray());

    // 访问元素
    var num = list.get(1);
    std.debug.print("\n访问索引 1 处的元素，得到 num = {}", .{num});

    // 更新元素
    list.set(1, 0);
    std.debug.print("\n将索引 1 处的元素更新为 0 ，得到 list = ", .{});
    inc.PrintUtil.printArray(i32, try list.toArray());

    // 测试扩容机制
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        try list.add(i);
    }
    std.debug.print("\n扩容后的列表 list = ", .{});
    inc.PrintUtil.printArray(i32, try list.toArray());
    std.debug.print(" ，容量 = {} ，长度 = {}\n", .{list.capacity(), list.size()});

    _ = try std.io.getStdIn().reader().readByte();
}

