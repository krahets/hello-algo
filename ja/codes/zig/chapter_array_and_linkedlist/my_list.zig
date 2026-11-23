// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// リストクラス
const MyList = struct {
    const Self = @This();

    items: []i32, // 配列（リストの要素を格納する）
    capacity: usize, // リストの容量
    allocator: std.mem.Allocator, // メモリアロケータ

    extend_ratio: usize = 2, // リストの容量を拡張する際の倍率

    // コンストラクタ（メモリの確保とリストの初期化）
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // デストラクタ（メモリの解放）
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // 末尾に要素を追加する
    pub fn add(self: *Self, item: i32) !void {
        // 要素数が容量を超える場合、容量を拡張する
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 要素を更新する
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // リストの長さ（現在の要素数）を取得する
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // リストの容量を取得する
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // 要素にアクセスする
    pub fn get(self: *Self, index: usize) i32 {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }
        return self.items[index];
    }

    // 要素を更新する
    pub fn set(self: *Self, index: usize, num: i32) void {
        // インデックスが範囲外の場合、例外を送出する。以下も同様
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }
        self.items[index] = num;
    }

    // 途中に要素を挿入する
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("インデックスが範囲外です");
        }

        // 要素数が容量を超える場合、容量を拡張する
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // インデックス index 以降の全要素を後ろに 1 つずらす
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // 要素を削除する
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("インデックスが範囲外です");
        }
        // インデックス index より後の全要素を前に 1 つずらす
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // 削除した要素を返す
        return item;
    }

    // リストを配列に変換する
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // 新しいスライスを返し、リストのコンテナをリセットまたは空にするかを設定する
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

    // リストの容量を拡張する
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

// 実行用コード
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // リストを初期化する
    var nums = MyList.init(allocator);
    // メモリの解放を遅延させる
    defer nums.deinit();

    // 末尾に要素を追加する
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("リスト nums = {} 、容量 = {} 、長さ = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // 途中に要素を挿入する
    try nums.insert(3, 6);
    std.debug.print(
        "インデックス 3 に数値 6 を挿入した結果 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 要素を削除する
    _ = nums.remove(3);
    std.debug.print(
        "インデックス 3 の要素を削除した結果 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 要素にアクセスする
    const num = nums.get(1);
    std.debug.print("インデックス 1 の要素にアクセスした結果 num = {}\n", .{num});

    // 要素を更新する
    nums.set(1, 0);
    std.debug.print(
        "インデックス 1 の要素を 0 に更新した結果 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 容量の拡張をテストする
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        try nums.add(i);
    }
    std.debug.print(
        "容量を拡張した後のリスト nums = {} 、容量 = {} 、長さ = {}\n",
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
