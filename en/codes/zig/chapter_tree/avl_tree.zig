// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL tree
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // Root node
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Allocator

        // Initialize the arena allocator
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // Deinitialize the arena and release its memory
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Get the node height
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // A null node has height -1; a leaf has height 0
            return if (node == null) -1 else node.?.height;
        }

        // Update the node height
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // The node height equals the height of its taller subtree + 1
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // Get the balance factor
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // A null node has balance factor 0
            if (node == null) return 0;
            // Node balance factor = left subtree height - right subtree height
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // Right rotation
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // Rotate node to the right around child
            child.?.right = node;
            node.?.left = grandChild;
            // Update the node height
            self.updateHeight(node);
            self.updateHeight(child);
            // Return the root of the rotated subtree
            return child;
        }

        // Left rotation
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // Rotate node to the left around child
            child.?.left = node;
            node.?.right = grandChild;
            // Update the node height
            self.updateHeight(node);
            self.updateHeight(child);
            // Return the root of the rotated subtree
            return child;
        }

        // Perform rotations to restore balance in this subtree
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // Get the balance factor of node
            var balance_factor = self.balanceFactor(node);
            // Left-heavy tree
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // Rotate right
                    return self.rightRotate(node);
                } else {
                    // Rotate left, then right
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // Right-heavy tree
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // Rotate left
                    return self.leftRotate(node);
                } else {
                    // Rotate right, then left
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // The tree is balanced; return without rotating
            return node;
        }

        // Insert a node
        fn insert(self: *Self, val: T) !void {
            self.root = (try self.insertHelper(self.root, val)).?;
        }

        // Insert a node recursively (helper method)
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. Find the insertion position and insert the node
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // Return without inserting a duplicate node
            }
            self.updateHeight(node);    // Update the node height
            // 2. Perform rotations to restore balance in this subtree
            node = self.rotate(node);
            // Return the root of the subtree
            return node;
        }

        // Remove a node
        fn remove(self: *Self, val: T) void {
           self.root = self.removeHelper(self.root, val).?;
        }

        // Remove a node recursively (helper method)
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. Find and remove the node
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // Number of children = 0: remove node and return
                    if (child == null) {
                        return null;
                    // Number of children = 1: remove node directly
                    } else {
                        node = child;
                    }
                } else {
                    // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // Update the node height
            // 2. Perform rotations to restore balance in this subtree
            node = self.rotate(node);
            // Return the root of the subtree
            return node;
        }

        // Find a node
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // Search while cur is not null
            while (cur != null) {
                // The target node lies in the right subtree of cur
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // The target node lies in the left subtree of cur
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // The target node was found; exit the loop
                } else {
                    break;
                }
            }
            // Return the matching node, or null if no match was found
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    try tree.insert(val);
    std.debug.print("\nAVL tree after inserting node {}:\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\nAVL tree after removing node {}:\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver code
pub fn main() !void {
    // Initialize an empty AVL tree
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // Insert a node
    // Observe how the AVL tree maintains balance after a node is inserted
    try testInsert(i32, &avl_tree, 1);
    try testInsert(i32, &avl_tree, 2);
    try testInsert(i32, &avl_tree, 3);
    try testInsert(i32, &avl_tree, 4);
    try testInsert(i32, &avl_tree, 5);
    try testInsert(i32, &avl_tree, 8);
    try testInsert(i32, &avl_tree, 7);
    try testInsert(i32, &avl_tree, 9);
    try testInsert(i32, &avl_tree, 10);
    try testInsert(i32, &avl_tree, 6);

    // Insert a duplicate node
    try testInsert(i32, &avl_tree, 7);

    // Remove a node
    // Observe how the AVL tree maintains balance after a node is removed
    testRemove(i32, &avl_tree, 8); // Remove a node with 0 children
    testRemove(i32, &avl_tree, 5); // Remove a node with 1 child
    testRemove(i32, &avl_tree, 4); // Remove a node with 2 children    

    // Find a node
    var node = avl_tree.search(7).?;
    std.debug.print("\nFound node: {any}, node value = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}