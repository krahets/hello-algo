// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Binary search tree
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Allocator

        // Initialize the allocator and build the tree from the array
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // Sort the array
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // Build the binary search tree
        }

        // Deinitialize the arena and release its memory
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Build the binary search tree
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // Use the middle array element as the root value
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // Recursively build the left and right subtrees
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // Get the root of the binary tree
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // Find a node
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // Search while cur is not null
            while (cur != null) {
                // The target node lies in the right subtree of cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // The target node lies in the left subtree of cur
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // The target node was found; exit the loop
                } else {
                    break;
                }
            }
            // Return the matching node, or null if no match was found
            return cur;
        }

        // Insert a node
        fn insert(self: *Self, num: T) !void {
            // If the tree is empty, allocate a root node
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // Search while cur is not null
            while (cur != null) {
                // Return immediately if a duplicate node is found
                if (cur.?.val == num) return;
                pre = cur;
                // The insertion position lies in the right subtree of cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // The insertion position lies in the left subtree of cur
                } else {
                    cur = cur.?.left;
                }
            }
            // Insert a node
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // Remove a node
        fn remove(self: *Self, num: T) void {
            // Return immediately if the tree is empty
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // Search while cur is not null
            while (cur != null) {
                // The node to remove was found; exit the loop
                if (cur.?.val == num) break;
                pre = cur;
                // The node to remove lies in the right subtree of cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // The node to remove lies in the left subtree of cur
                } else {
                    cur = cur.?.left;
                }
            }
            // Return immediately if the node to remove does not exist
            if (cur == null) return;
            // Number of children = 0 or 1
            if (cur.?.left == null or cur.?.right == null) {
                // With 0 or 1 child, child is null or the existing child, respectively
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // Remove node cur
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // Number of children = 2
            } else {
                // Get the inorder successor of cur
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // Recursively remove node tmp
                self.remove(tmp.?.val);
                // Replace the value of cur with the value of tmp
                cur.?.val = tmp_val;
            }
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the binary tree
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("Binary tree after initialization:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // Find a node
    var node = bst.search(7);
    std.debug.print("\nFound node: {any}, node value = {}\n", .{node, node.?.val});

    // Insert a node
    try bst.insert(16);
    std.debug.print("\nBinary tree after inserting node 16:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // Remove a node
    bst.remove(1);
    std.debug.print("\nBinary tree after removing node 1:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\nBinary tree after removing node 2:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\nBinary tree after removing node 4:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
