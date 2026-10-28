// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 연결 리스트로 구현한 스택
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // 머리 노드를 스택의 맨 위로 사용한다
        stk_size: usize = 0,                             // 스택의 길이
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // 메모리 할당자

        // 생성자(메모리 할당 및 스택 초기화)
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // 소멸자(메모리 해제)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 스택의 길이 반환
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // 스택이 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 스택 맨 위 원소 접근
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("스택이 비어 있다");
            return self.stack_top.?.val;
        }  

        // 스택에 삽입
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // 스택에서 꺼내기
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // 스택을 배열로 변환한다
        pub fn toArray(self: *Self) ![]T {
            var node = self.stack_top;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[res.len - i - 1] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// 실행 코드
pub fn main() !void {
    // 스택 초기화
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // 메모리 해제를 지연한다
    defer stack.deinit();

    // 스택에 원소 삽입
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("스택 stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 스택 맨 위 원소 접근
    var peek = stack.peek();
    std.debug.print("\n스택의 맨 위 원소 top = {}", .{peek});

    // 스택에서 원소 꺼내기
    var pop = stack.pop();
    std.debug.print("\n꺼낸 원소 pop = {}, 꺼낸 뒤 stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // 스택의 길이 반환
    var size = stack.size();
    std.debug.print("\n스택 길이 size = {}", .{size});

    // 스택이 비어 있는지 판단
    var is_empty = stack.isEmpty();
    std.debug.print("\n스택이 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

