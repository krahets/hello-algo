// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 列表类
const MyList = struct {
    const Self = @This();

    items: []i32, // 数组（存储列表元素）
    capacity: usize, // 列表容量
    allocator: std.mem.Allocator, // 内存分配器

    extend_ratio: usize = 2, // 每次列表扩容的倍数

    // 构造函数（分配内存+初始化列表）
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // 析构函数（释放内存）
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // 在尾部添加元素
    pub fn add(self: *Self, item: i32) !void {
        // 元素数量超出容量时，触发扩容机制
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 更新元素
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // 获取列表长度（当前元素数量）
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // 获取列表容量
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // 访问元素
    pub fn get(self: *Self, index: usize) i32 {
        // 索引如果越界，则抛出异常，下同
        if (index < 0 or index >= self.items.len) {
            @panic("索引越界");
        }
        return self.items[index];
    }

    // 更新元素
    pub fn set(self: *Self, index: usize, num: i32) void {
        // 索引如果越界，则抛出异常，下同
        if (index < 0 or index >= self.items.len) {
            @panic("索引越界");
        }
        self.items[index] = num;
    }

    // 在中间插入元素
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("索引越界");
        }

        // 元素数量超出容量时，触发扩容机制
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 将索引 index 以及之后的元素都向后移动一位
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // 删除元素
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("索引越界");
        }
        // 将索引 index 之后的元素都向前移动一位
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // 返回被删除的元素
        return item;
    }

    // 将列表转换为数组
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // 返回新的切片并设置是否要重置或清空列表容器
    pub fn toOwnedSlice(self: *Self, clear: bool) ![]i32 {
        const allocator = self.allocator;
        const old_memory = self.allocatedSlice();
        if (allocator.remap(old_memory, self.items.len)) |new_items| {
            if (clear) {
                self.* = init(allocator);
            }
            return new_items;
        }

        const new_memory = try allocator.alloc(i32, self.items.len);
        @memcpy(new_memory, self.items);
        if (clear) {
            self.clearAndFree();
        }
        return new_memory;
    }

    // 列表扩容
    fn ensureTotalCapacity(self: *Self, new_capacity: usize) !void {
        if (self.capacity >= new_capacity) return;
        const capcacity = if (self.capacity == 0) 10 else self.capacity;
        const better_capacity = capcacity * self.extend_ratio;

        const old_memory = self.allocatedSlice();
        if (self.allocator.remap(old_memory, better_capacity)) |new_memory| {
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        } else {
            const new_memory = try self.allocator.alloc(i32, better_capacity);
            @memcpy(new_memory[0..self.items.len], self.items);
            self.allocator.free(old_memory);
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        }
    }

    fn clearAndFree(self: *Self, allocator: std.mem.Allocator) void {
        allocator.free(self.allocatedSlice());
        self.items.len = 0;
        self.capacity = 0;
    }

    fn allocatedSlice(self: Self) []i32 {
        return self.items.ptr[0..self.capacity];
    }
};

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // 初始化列表
    var nums = MyList.init(allocator);
    // 延迟释放内存
    defer nums.deinit();

    // 在尾部添加元素
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("列表 nums = {} ，容量 = {} ，长度 = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // 在中间插入元素
    try nums.insert(3, 6);
    std.debug.print(
        "在索引 3 处插入数字 6 ，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 删除元素
    _ = nums.remove(3);
    std.debug.print(
        "删除索引 3 处的元素，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 访问元素
    const num = nums.get(1);
    std.debug.print("访问索引 1 处的元素，得到 num = {}\n", .{num});

    // 更新元素
    nums.set(1, 0);
    std.debug.print(
        "将索引 1 处的元素更新为 0 ，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 测试扩容机制
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        try nums.add(i);
    }
    std.debug.print(
        "扩容后的列表 nums = {} ，容量 = {} ，长度 = {}\n",
        .{
            utils.fmt.slice(nums.items),
            nums.getCapacity(),
            nums.getSize(),
        },
    );

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "my_list" {
    try run();
}
