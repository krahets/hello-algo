// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 리스트 클래스
const MyList = struct {
    const Self = @This();

    items: []i32, // 배열(리스트 원소 저장)
    capacity: usize, // 리스트 용량
    allocator: std.mem.Allocator, // 메모리 할당자

    extend_ratio: usize = 2, // 리스트의 용량을 확장할 때마다 적용하는 배수

    // 생성자(메모리 할당 및 리스트 초기화)
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // 소멸자(메모리 해제)
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // 맨 뒤에 원소 추가
    pub fn add(self: *Self, item: i32) !void {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 원소 갱신
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // 리스트 길이(현재 원소 개수) 반환
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // 리스트 용량 반환
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // 원소 접근
    pub fn get(self: *Self, index: usize) i32 {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if (index < 0 or index >= self.items.len) {
            @panic("인덱스가 범위를 벗어났다");
        }
        return self.items[index];
    }

    // 원소 갱신
    pub fn set(self: *Self, index: usize, num: i32) void {
        // 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
        if (index < 0 or index >= self.items.len) {
            @panic("인덱스가 범위를 벗어났다");
        }
        self.items[index] = num;
    }

    // 중간에 원소 삽입
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("인덱스가 범위를 벗어났다");
        }

        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // 원소 삭제
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("인덱스가 범위를 벗어났다");
        }
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // 삭제한 원소를 반환한다
        return item;
    }

    // 리스트를 배열로 변환
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // 새 슬라이스를 반환하고 리스트 컨테이너를 재설정하거나 비울지 지정한다
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

    // 리스트 용량 확장
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

// 실행 코드
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // 리스트 초기화
    var nums = MyList.init(allocator);
    // 메모리 해제를 지연한다
    defer nums.deinit();

    // 맨 뒤에 원소 추가
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("리스트 nums = {}, 용량 = {}, 길이 = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // 중간에 원소 삽입
    try nums.insert(3, 6);
    std.debug.print(
        "인덱스 3에 숫자 6을 삽입한 후 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 원소 삭제
    _ = nums.remove(3);
    std.debug.print(
        "인덱스 3의 원소를 삭제한 후 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 원소 접근
    const num = nums.get(1);
    std.debug.print("인덱스 1의 원소에 접근하여 얻은 num = {}\n", .{num});

    // 원소 갱신
    nums.set(1, 0);
    std.debug.print(
        "인덱스 1의 원소를 0으로 갱신한 후 nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // 용량 확장 동작 테스트
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
        try nums.add(i);
    }
    std.debug.print(
        "용량을 확장한 후의 리스트 nums = {}, 용량 = {}, 길이 = {}\n",
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
