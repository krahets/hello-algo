// File: linkedlist_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 연결 리스트로 구현한 큐
pub fn LinkedListQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*inc.ListNode(T) = null,                // 머리 노드 front
        rear: ?*inc.ListNode(T) = null,                 // 꼬리 노드 rear
        que_size: usize = 0,                            // 큐의 길이
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 메모리 할당자

        // 생성자(메모리 할당 및 큐 초기화)
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // 소멸자(메모리 해제)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 큐의 길이 반환
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 큐가 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 맨 앞 원소 접근
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("큐가 비어 있다");
            return self.front.?.val;
        }  

        // 큐에 삽입
        pub fn push(self: *Self, num: T) !void {
            // 꼬리 노드 뒤에 num을 추가한다
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
            if (self.front == null) {
                self.front = node;
                self.rear = node;
            // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
            } else {
                self.rear.?.next = node;
                self.rear = node;
            }
            self.que_size += 1;
        } 

        // 큐에서 꺼내기
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 머리 노드를 삭제한다
            self.front = self.front.?.next;
            self.que_size -= 1;
            return num;
        } 

        // 연결 리스트를 배열로 변환한다
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// 실행 코드
pub fn main() !void {
    // 큐 초기화
    var queue = LinkedListQueue(i32){};
    try queue.init(std.heap.page_allocator);
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

    _ = try std.io.getStdIn().reader().readByte();
}
