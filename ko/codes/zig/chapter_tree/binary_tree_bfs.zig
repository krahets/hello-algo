// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 레벨 순서 순회
fn levelOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
    // 큐를 초기화하고 루트 노드를 넣는다
    const L = std.TailQueue(*inc.TreeNode(T));
    var queue = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    queue.append(root_node); 
    // 순회 순서를 저장할 리스트를 초기화한다
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    while (queue.len > 0) {
        var queue_node = queue.popFirst().?;    // 큐에서 꺼낸다
        var node = queue_node.data;
        try list.append(node.val);              // 노드 값을 저장한다
        if (node.left != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            queue.append(tmp_node);             // 왼쪽 자식 노드를 큐에 삽입한다
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // 오른쪽 자식 노드를 큐에 삽입한다
        }        
    }
    return list;
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

    // 레벨 순서 순회
    var list = try levelOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\n레벨 순서 순회의 노드 출력 순서 = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}