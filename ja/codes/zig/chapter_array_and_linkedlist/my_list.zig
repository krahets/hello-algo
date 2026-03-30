// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// リストクラス
const MyList = struct {
    const Self = @This();

    items: []i32, // 配列（リスト要素を格納）
    capacity: usize, // リスト容量
    allocator: std.mem.Allocator, // メモリアロケータ

    extend_ratio: usize = 2, // リスト拡張時の増加倍率

    // コンストラクタ（メモリを確保してリストを初期化）
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // デストラクタ（メモリを解放する）
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // 末尾に要素を追加
    pub fn add(self: *Self, item: i32) !void {
        // 要素数が容量を超えると、拡張機構が発動する
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 要素を更新
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // リストの長さを取得（現在の要素数）
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // リスト容量を取得する
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // 要素にアクセス
    pub fn get(self: *Self, index: usize) i32 {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }
        return self.items[index];
    }

    // 要素を更新
    pub fn set(self: *Self, index: usize, num: i32) void {
        // インデックスが範囲外なら例外を送出する。以下同様
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }
        self.items[index] = num;
    }

    // 中間に要素を挿入
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }

        // 要素数が容量を超えると、拡張機構が発動する
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // index 以降の要素をすべて 1 つ後ろへずらす
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // 要素を削除
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("インデックスが範囲外です");
        }
        // インデックス index より後の要素をすべて 1 つ前に移動する
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // 削除された要素を返す
        return item;
    }

    // リストを配列に変換する
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // 新しいスライスを返し、リストコンテナをリセットまたはクリアするかどうかを設定する
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

    // リストの拡張
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

    // リストを初期化
    var nums = MyList.init(allocator);
    // メモリの遅延解放
    defer nums.deinit();

    // 末尾に要素を追加
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("リスト nums = {} ，容量 = {} ，長さ = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // 中間に要素を挿入
    try nums.insert(3, 6);
    std.debug.print(
        "インデックス 3 に数値 6 を挿入すると、nums = {}\n",
            .{utils.fmt.slice(nums.items)},
        );

    // 要素を削除
    _ = nums.remove(3);
    std.debug.print(
        "インデックス 3 の要素を削除すると、nums = {}\n",
            .{utils.fmt.slice(nums.items)},
        );

    // 要素にアクセス
    const num = nums.get(1);
    std.debug.print("インデックス 1 の要素にアクセスすると、num = {}\n", .{num});

    // 要素を更新
    nums.set(1, 0);
    std.debug.print(
        "インデックス 1 の要素を 0 に更新すると、nums = {}\n",
            .{utils.fmt.slice(nums.items)},
        );

    // 拡張機構をテストする
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
        try nums.add(i);
    }
    std.debug.print(
        "拡張後のリスト nums = {} ，容量 = {} ，長さ = {}\n",
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
