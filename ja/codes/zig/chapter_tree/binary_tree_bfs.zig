// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// レベル順走査
fn levelOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
    // キューを初期化し、ルートノードを追加する
    const L = std.TailQueue(*inc.TreeNode(T));
    var queue = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    queue.append(root_node); 
    // 走査順序を保存するためのリストを初期化する
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    while (queue.len > 0) {
        var queue_node = queue.popFirst().?;    // デキュー
        var node = queue_node.data;
        try list.append(node.val);              // ノードの値を保存する
        if (node.left != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            queue.append(tmp_node);             // 左子ノードをキューに追加
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // 右子ノードをキューに追加
        }        
    }
    return list;
}

// Driver Code
pub fn main() !void {
    // メモリアロケータを初期化する
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 二分木を初期化
    // ここでは、配列から直接二分木を生成する関数を利用する
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("二分木を初期化\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // レベル順走査
    var list = try levelOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\nレベル順走査のノード出力シーケンス = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}