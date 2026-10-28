// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 실행 코드
pub fn main() !void {
    // 큐 초기화
    const L = std.TailQueue(i32);
    var queue = L{};  

    // 큐에 원소 삽입
    var node1 = L.Node{ .data = 1 };
    var node2 = L.Node{ .data = 3 };
    var node3 = L.Node{ .data = 2 };
    var node4 = L.Node{ .data = 5 };
    var node5 = L.Node{ .data = 4 };
    queue.append(&node1);
    queue.append(&node2);
    queue.append(&node3);
    queue.append(&node4);
    queue.append(&node5);
    std.debug.print("큐 queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // 맨 앞 원소 접근
    var peek = queue.first.?.data;
    std.debug.print("\n맨 앞 원소 peek = {}", .{peek});

    // 큐에서 원소 꺼내기
    var pop = queue.popFirst().?.data;
    std.debug.print("\n꺼낸 원소 pop = {}, 꺼낸 뒤 queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // 큐의 길이 반환
    var size = queue.len;
    std.debug.print("\n큐 길이 size = {}", .{size});

    // 큐가 비어 있는지 판단
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\n큐가 비어 있는가 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
