// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// 전위 순회
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// 중위 순회
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// 후위 순회
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
}

// 실행 코드
pub fn main() !void {
    // 메모리 할당자 초기화
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 이진 트리 초기화
    // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("이진 트리 초기화\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // 전위 순회
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\n전위 순회의 노드 출력 순서 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 중위 순회
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\n중위 순회의 노드 출력 순서 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 후위 순회
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\n후위 순회에서 출력한 노드 순서 = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}