// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 배열로 구현한 스택
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // 생성자(메모리 할당 및 스택 초기화)
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // 소멸자(메모리 해제)
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // 스택의 길이 반환
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // 스택이 비어 있는지 판단
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // 스택 맨 위 원소 접근
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("스택이 비어 있다");
            return self.stack.?.items[self.size() - 1];
        }  

        // 스택에 삽입
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // 스택에서 꺼내기
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // ArrayList 반환
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// 실행 코드
pub fn main() !void {
    // 스택 초기화
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // 메모리 해제를 지연한다
    defer stack.deinit();

    // 스택에 원소 삽입
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("스택 stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // 스택 맨 위 원소 접근
    var peek = stack.peek();
    std.debug.print("\n스택 맨 위 원소 peek = {}", .{peek});

    // 스택에서 원소 꺼내기
    var top = stack.pop();
    std.debug.print("\n꺼낸 원소 pop = {}, 꺼낸 뒤 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // 스택의 길이 반환
    var size = stack.size();
    std.debug.print("\n스택 길이 size = {}", .{size});

    // 스택이 비어 있는지 판단
    var is_empty = stack.isEmpty();
    std.debug.print("\n스택이 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
