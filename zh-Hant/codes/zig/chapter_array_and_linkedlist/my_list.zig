// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 串列類別
pub fn MyList(comptime T: type) type {
    return struct {
        const Self = @This();
        
        arr: []T = undefined,                        // 陣列（儲存串列元素）
        arrCapacity: usize = 10,                     // 串列容量
        numSize: usize = 0,                           // 串列長度（當前元素數量）
        extendRatio: usize = 2,                       // 每次串列擴容的倍數
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined, // 記憶體分配器

        // 建構子（分配記憶體+初始化串列）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.arr = try self.mem_allocator.alloc(T, self.arrCapacity);
            @memset(self.arr, @as(T, 0));
        }

        // 析構函式（釋放記憶體）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 獲取串列長度（當前元素數量）
        pub fn size(self: *Self) usize {
            return self.numSize;
        }

        // 獲取串列容量
        pub fn capacity(self: *Self) usize {
            return self.arrCapacity;
        }

        // 訪問元素
        pub fn get(self: *Self, index: usize) T {
            // 索引如果越界，則丟擲異常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            return self.arr[index];
        }  

        // 更新元素
        pub fn set(self: *Self, index: usize, num: T) void {
            // 索引如果越界，則丟擲異常，下同
            if (index < 0 or index >= self.size()) @panic("索引越界");
            self.arr[index] = num;
        }  

        // 在尾部新增元素
        pub fn add(self: *Self, num: T) !void {
            // 元素數量超出容量時，觸發擴容機制
            if (self.size() == self.capacity()) try self.extendCapacity();
            self.arr[self.size()] = num;
            // 更新元素數量
            self.numSize += 1;
        }  

        // 在中間插入元素
        pub fn insert(self: *Self, index: usize, num: T) !void {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            // 元素數量超出容量時，觸發擴容機制
            if (self.size() == self.capacity()) try self.extendCapacity();
            // 將索引 index 以及之後的元素都向後移動一位
            var j = self.size() - 1;
            while (j >= index) : (j -= 1) {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // 更新元素數量
            self.numSize += 1;
        }

        // 刪除元素
        pub fn remove(self: *Self, index: usize) T {
            if (index < 0 or index >= self.size()) @panic("索引越界");
            var num = self.arr[index];
            // 將索引 index 之後的元素都向前移動一位
            var j = index;
            while (j < self.size() - 1) : (j += 1) {
                self.arr[j] = self.arr[j + 1];
            }
            // 更新元素數量
            self.numSize -= 1;
            // 返回被刪除的元素
            return num;
        }

        // 串列擴容
        pub fn extendCapacity(self: *Self) !void {
            // 新建一個長度為 size * extendRatio 的陣列，並將原陣列複製到新陣列
            var newCapacity = self.capacity() * self.extendRatio;
            var extend = try self.mem_allocator.alloc(T, newCapacity);
            @memset(extend, @as(T, 0));
            // 將原陣列中的所有元素複製到新陣列
            std.mem.copy(T, extend, self.arr);
            self.arr = extend;
            // 更新串列容量
            self.arrCapacity = newCapacity;
        }

        // 將串列轉換為陣列
        pub fn toArray(self: *Self) ![]T {
            // 僅轉換有效長度範圍內的串列元素
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
    // 初始化串列
    var nums = MyList(i32){};
    try nums.init(std.heap.page_allocator);
    // 延遲釋放記憶體
    defer nums.deinit();

    // 在尾部新增元素
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("串列 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());
    std.debug.print(" ，容量 = {} ，長度 = {}", .{nums.capacity(), nums.size()});

    // 在中間插入元素
    try nums.insert(3, 6);
    std.debug.print("\n在索引 3 處插入數字 6 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 刪除元素
    _ = nums.remove(3);
    std.debug.print("\n刪除索引 3 處的元素，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 訪問元素
    var num = nums.get(1);
    std.debug.print("\n訪問索引 1 處的元素，得到 num = {}", .{num});

    // 更新元素
    nums.set(1, 0);
    std.debug.print("\n將索引 1 處的元素更新為 0 ，得到 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());

    // 測試擴容機制
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
        try nums.add(i);
    }
    std.debug.print("\n擴容後的串列 nums = ", .{});
    inc.PrintUtil.printArray(i32, try nums.toArray());
    std.debug.print(" ，容量 = {} ，長度 = {}\n", .{nums.capacity(), nums.size()});

    _ = try std.io.getStdIn().reader().readByte();
}
