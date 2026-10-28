// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 이중 연결 리스트 노드
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // 노드 값
        next: ?*Self = null,    // 다음 노드 포인터
        prev: ?*Self = null,    // 이전 노드 포인터

        // 지정한 값으로 연결 리스트 노드를 초기화한다
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// 이중 연결 리스트로 구현한 덱
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // 머리 노드 front
        rear: ?*ListNode(T) = null,                     // 꼬리 노드 rear
        que_size: usize = 0,                             // 덱의 길이
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

        // 덱의 길이 반환
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 덱이 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 큐 삽입 연산
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // 맨 앞에 삽입하는 연산
            } else if (is_front) {
                // node를 연결 리스트의 맨 앞에 추가한다
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // 머리 노드를 갱신한다
            // 맨 뒤에 삽입하는 연산
            } else {
                // node를 연결 리스트의 맨 뒤에 추가한다
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // 꼬리 노드를 갱신한다
            }
            self.que_size += 1;      // 큐 길이를 갱신한다
        } 

        // 맨 앞에 삽입
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // 맨 뒤에 삽입
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // 큐에서 꺼내는 연산
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("덱이 비어 있다");
            var val: T = undefined;
            // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
            if (self.que_size == 1) {
                val = self.front.?.val;
                self.front = null;
                self.rear = null;
            }
            // 맨 앞에서 꺼내는 연산
            else if (is_front) {
                val = self.front.?.val;     // 머리 노드의 값을 임시로 저장한다
                // 머리 노드를 삭제한다
                var fNext = self.front.?.next;
                fNext.?.prev = null;
                self.front.?.next = null;
                self.front = fNext;         // 머리 노드를 갱신한다
            // 맨 뒤에서 꺼내는 연산
            } else {
                val = self.rear.?.val;      // 꼬리 노드의 값을 임시로 저장한다
                // 꼬리 노드를 삭제한다
                var rPrev = self.rear.?.prev;
                rPrev.?.next = null;
                self.rear.?.prev = null;
                self.rear = rPrev;          // 꼬리 노드를 갱신한다
            }
            self.que_size -= 1;              // 큐 길이를 갱신한다
            return val;
        } 

        // 맨 앞에서 꺼내기
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // 맨 뒤에서 꺼내기
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // 맨 앞 원소 접근
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("덱이 비어 있다");
            return self.front.?.val;
        }  

        // 맨 뒤 원소 접근
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("덱이 비어 있다");
            return self.rear.?.val;
        }

        // 출력에 사용할 배열 반환
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
    // 덱 초기화
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("덱 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 원소 접근
    var peek_first = deque.peekFirst();
    std.debug.print("\n맨 앞 원소 peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\n맨 뒤 원소 peek_last = {}", .{peek_last});

    // 큐에 원소 삽입
    try deque.pushLast(4);
    std.debug.print("\n원소 4를 뒤에 삽입한 뒤 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\n원소 1을 앞에 삽입한 뒤 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 큐에서 원소 꺼내기
    var pop_last = deque.popLast();
    std.debug.print("\n뒤에서 꺼낸 원소 = {}, 꺼낸 뒤 deque = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\n앞에서 꺼낸 원소 = {}, 꺼낸 뒤 deque = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 덱의 길이 반환
    var size = deque.size();
    std.debug.print("\n덱 길이 size = {}", .{size});

    // 덱이 비어 있는지 판단
    var is_empty = deque.isEmpty();
    std.debug.print("\n덱이 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
