// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 원형 배열로 구현한 큐
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // 큐의 원소를 저장하는 배열     
        cap: usize = 0,                                 // 큐 용량
        front: usize = 0,                               // 맨 앞 원소를 가리키는 맨 앞 포인터
        queSize: usize = 0,                             // 맨 뒤 포인터, 큐의 맨 뒤 + 1을 가리킨다
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 메모리 할당자

        // 생성자(메모리 할당 및 배열 초기화)
        pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.cap = cap;
            self.nums = try self.mem_allocator.alloc(T, self.cap);
            @memset(self.nums, @as(T, 0));
        }
        
        // 소멸자(메모리 해제)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 큐의 용량 반환
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // 큐의 길이 반환
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // 큐가 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // 큐에 삽입
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("큐가 가득 찼다\n", .{});
                return;
            }
            // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
            // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
            var rear = (self.front + self.queSize) % self.capacity();
            // 꼬리 노드 뒤에 num을 추가한다
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // 큐에서 꺼내기
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // 맨 앞 원소 접근
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("큐가 비어 있다");
            return self.nums[self.front];
        } 

        // 배열 반환
        pub fn toArray(self: *Self) ![]T {
            // 유효한 길이 범위 안의 리스트 원소만 변환한다
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            var j: usize = self.front;
            while (i < self.size()) : ({ i += 1; j += 1; }) {
                res[i] = self.nums[j % self.capacity()];
            }
            return res;
        }
    };
}

// 실행 코드
pub fn main() !void {
    // 큐 초기화
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
    defer queue.deinit();

    // 큐에 원소 삽입
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("큐 queue = ", .{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // 맨 앞 원소 접근
    var peek = queue.peek();
    std.debug.print("\n맨 앞 원소 peek = {}", .{peek});

    // 큐에서 원소 꺼내기
    var pop = queue.pop();
    std.debug.print("\n꺼낸 원소 pop = {}, 꺼낸 뒤 queue = ", .{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // 큐의 길이 반환
    var size = queue.size();
    std.debug.print("\n큐 길이 size = {}", .{size});

    // 큐가 비어 있는지 판단
    var is_empty = queue.isEmpty();
    std.debug.print("\n큐가 비어 있는가 = {}", .{is_empty});

    // 원형 배열 테스트
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\n반복 번호 {}의 삽입 및 꺼내기 후 queue = ", .{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
