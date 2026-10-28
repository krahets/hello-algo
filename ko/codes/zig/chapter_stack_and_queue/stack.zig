// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 실행 코드
pub fn main() !void {
    // 스택 초기화
    // Zig에서는 ArrayList를 스택으로 사용하는 것을 권장한다
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // 메모리 해제를 지연한다
    defer stack.deinit();

    // 스택에 원소 삽입
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("스택 stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // 스택 맨 위 원소 접근
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\n스택 맨 위 원소 peek = {}", .{peek});

    // 스택에서 원소 꺼내기
    var pop = stack.pop();
    std.debug.print("\n꺼낸 원소 pop = {}, 꺼낸 뒤 stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // 스택의 길이 반환
    var size = stack.items.len;
    std.debug.print("\n스택 길이 size = {}", .{size});

    // 스택이 비어 있는지 판단
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\n스택이 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
