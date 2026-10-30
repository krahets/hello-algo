// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Level-order traversal
fn levelOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
    // Initialize a queue and enqueue the root
    const L = std.TailQueue(*inc.TreeNode(T));
    var queue = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    queue.append(root_node); 
    // Initialize a list to store the traversal sequence
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    while (queue.len > 0) {
        var queue_node = queue.popFirst().?;    // Dequeue from the queue
        var node = queue_node.data;
        try list.append(node.val);              // Store the node value
        if (node.left != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            queue.append(tmp_node);             // Enqueue the left child
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // Enqueue the right child
        }        
    }
    return list;
}

// Driver code
pub fn main() !void {
    // Initialize the allocator
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Initialize the binary tree
    // Use a helper function that builds a binary tree directly from an array
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("Initialize the binary tree\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // Level-order traversal
    var list = try levelOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\nNode sequence from level-order traversal = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}