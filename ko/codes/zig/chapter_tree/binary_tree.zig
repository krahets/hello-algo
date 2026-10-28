// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 실행 코드
pub fn main() !void {
    // 이진 트리 초기화
    // 노드 초기화
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // 노드 사이의 참조(포인터)를 설정한다
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("이진 트리 초기화\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // 노드 삽입과 삭제
    var p = inc.TreeNode(i32){ .val = 0 };
    // n1 -> n2 사이에 노드 P를 삽입한다
    n1.left = &p;
    p.left = &n2;
    std.debug.print("노드 P를 삽입한 후\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // 노드 삭제
    n1.left = &n2;
    std.debug.print("노드 P를 삭제한 후\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

