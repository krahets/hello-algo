// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化雙向佇列
    const L = std.TailQueue(i32);
    var deque = L{};  

    // 元素入列
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // 新增至佇列尾
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // 新增至佇列首
    deque.prepend(&node5);
    std.debug.print("雙向佇列 deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // 訪問元素
    var peek_first = deque.first.?.data; // 佇列首元素
    std.debug.print("\n佇列首元素 peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // 佇列尾元素
    std.debug.print("\n佇列尾元素 peek_last = {}", .{peek_last});

    // 元素出列
    var pop_first = deque.popFirst().?.data;    // 佇列首元素出列
    std.debug.print("\n佇列首出列元素 pop_first = {}，佇列首出列後 deque = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // 佇列尾元素出列
    std.debug.print("\n佇列尾出列元素 pop_last = {}，佇列尾出列後 deque = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // 獲取雙向佇列的長度
    var size = deque.len;
    std.debug.print("\n雙向佇列長度 size = {}", .{size});

    // 判斷雙向佇列是否為空
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\n雙向佇列是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
