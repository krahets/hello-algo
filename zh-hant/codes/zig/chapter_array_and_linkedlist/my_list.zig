// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 列表類別
const MyList = struct {
    const Self = @This();

    items: []i32, // 陣列（用來儲存列表元素）
    capacity: usize, // 列表容量
    allocator: std.mem.Allocator, // 記憶體配置器

    extend_ratio: usize = 2, // 每次擴充列表容量的倍數

    // 建構函式（配置記憶體並初始化列表）
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // 解構函式（釋放記憶體）
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // 在尾端加入元素
    pub fn add(self: *Self, item: i32) !void {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 更新元素
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // 取得列表長度（目前的元素數量）
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // 取得列表容量
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // 存取元素
    pub fn get(self: *Self, index: usize) i32 {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 or index >= self.items.len) {
            @panic("索引超出範圍");
        }
        return self.items[index];
    }

    // 更新元素
    pub fn set(self: *Self, index: usize, num: i32) void {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 or index >= self.items.len) {
            @panic("索引超出範圍");
        }
        self.items[index] = num;
    }

    // 在中間插入元素
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("索引超出範圍");
        }

        // 若加入元素後數量將超過容量，就觸發擴充機制
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 將索引 index 起的所有元素往後移一格
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // 刪除元素
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("索引超出範圍");
        }
        // 將索引 index 之後的所有元素往前移一格
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // 回傳刪除的元素
        return item;
    }

    // 將列表轉為陣列
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // 回傳新的切片，並設定是否要重設或清空列表容器
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

    // 擴充列表容量
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

// 範例主程式
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // 初始化列表
    var nums = MyList.init(allocator);
    // 延後釋放記憶體
    defer nums.deinit();

    // 在尾端加入元素
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("列表 nums = {}，容量 = {}，長度 = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // 在中間插入元素
    try nums.insert(3, 6);
    std.debug.print(
        "在索引 3 處插入數字 6，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 刪除元素
    _ = nums.remove(3);
    std.debug.print(
        "刪除索引 3 處的元素，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 存取元素
    const num = nums.get(1);
    std.debug.print("存取索引 1 處的元素，得到 num = {}\n", .{num});

    // 更新元素
    nums.set(1, 0);
    std.debug.print(
        "將索引 1 處的元素更新為 0，得到 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 測試容量擴充機制
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        try nums.add(i);
    }
    std.debug.print(
        "擴充後的列表 nums = {}，容量 = {}，長度 = {}\n",
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
