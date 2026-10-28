// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 실행 코드
pub fn main() !void {
    // 덱 초기화
    const L = std.TailQueue(i32);
    var deque = L{};  

    // 큐에 원소 삽입
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // 맨 뒤에 추가한다
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // 맨 앞에 추가한다
    deque.prepend(&node5);
    std.debug.print("덱 deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // 원소 접근
    var peek_first = deque.first.?.data; // 맨 앞 원소
    std.debug.print("\n맨 앞 원소 peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // 맨 뒤 원소
    std.debug.print("\n맨 뒤 원소 peek_last = {}", .{peek_last});

    // 큐에서 원소 꺼내기
    var pop_first = deque.popFirst().?.data;    // 맨 앞 원소를 꺼낸다
    std.debug.print("\n맨 앞에서 꺼낸 원소 pop_first = {}, 맨 앞에서 꺼낸 후 deque = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // 맨 뒤 원소를 꺼낸다
    std.debug.print("\n맨 뒤에서 꺼낸 원소 pop_last = {}, 맨 뒤에서 꺼낸 후 deque = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // 덱의 길이 반환
    var size = deque.len;
    std.debug.print("\n덱 길이 size = {}", .{size});

    // 덱이 비어 있는지 판단
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\n덱이 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
