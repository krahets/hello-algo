// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 平衡二叉树
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // 根节点
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

        // 构造函数
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // 析构函数
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 获取结点高度
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // 空结点高度为 -1 ，叶结点高度为 0
            return if (node == null) -1 else node.?.height;
        }

        // 更新结点高度
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // 结点高度等于最高子树高度 + 1
            node.?.height = std.math.max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // 获取平衡因子
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // 空结点平衡因子为 0
            if (node == null) return 0;
            // 结点平衡因子 = 左子树高度 - 右子树高度
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // 右旋操作
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // 以 child 为原点，将 node 向右旋转
            child.?.right = node;
            node.?.left = grandChild;
            // 更新结点高度
            self.updateHeight(node);
            self.updateHeight(child);
            // 返回旋转后子树的根节点
            return child;
        }

        // 左旋操作
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // 以 child 为原点，将 node 向左旋转
            child.?.left = node;
            node.?.right = grandChild;
            // 更新结点高度
            self.updateHeight(node);
            self.updateHeight(child);
            // 返回旋转后子树的根节点
            return child;
        }

        // 执行旋转操作，使该子树重新恢复平衡
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // 获取结点 node 的平衡因子
            var balance_factor = self.balanceFactor(node);
            // 左偏树
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // 右旋
                    return self.rightRotate(node);
                } else {
                    // 先左旋后右旋
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // 右偏树
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // 左旋
                    return self.leftRotate(node);
                } else {
                    // 先右旋后左旋
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // 平衡树，无需旋转，直接返回
            return node;
        }

        // 插入结点
        fn insert(self: *Self, val: T) !?*inc.TreeNode(T) {
            self.root = try self.insertHelper(self.root, val);
            return self.root;
        }

        // 递归插入结点（辅助函数）
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. 查找插入位置，并插入结点
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // 重复结点不插入，直接返回
            }
            self.updateHeight(node);    // 更新结点高度
            // 2. 执行旋转操作，使该子树重新恢复平衡
            node = self.rotate(node);
            // 返回子树的根节点
            return node;
        }

        // 删除结点
        fn remove(self: *Self, val: T) ?*inc.TreeNode(T) {
           self.root = self.removeHelper(self.root, val);
            return self.root;
        }

        // 递归删除结点（辅助函数）
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. 查找结点，并删除之
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // 子结点数量 = 0 ，直接删除 node 并返回
                    if (child == null) {
                        return null;
                    // 子结点数量 = 1 ，直接删除 node
                    } else {
                        node = child;
                    }
                } else {
                    // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                    var temp = self.getInOrderNext(node.?.right);
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node);    // 更新结点高度
            // 2. 执行旋转操作，使该子树重新恢复平衡
            node = self.rotate(node);
            // 返回子树的根节点
            return node;
        }

        // 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况）
        fn getInOrderNext(self: *Self, node_: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            _ = self;
            var node = node_;
            if (node == null) return node;
            // 循环访问左子结点，直到叶结点时为最小结点，跳出
            while (node.?.left != null) {
                node = node.?.left;
            }
            return node;
        }

        // 查找结点
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 循环查找，越过叶结点后跳出
            while (cur != null) {
                // 目标结点在 cur 的右子树中
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // 目标结点在 cur 的左子树中
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // 找到目标结点，跳出循环
                } else {
                    break;
                }
            }
            // 返回目标结点
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    _ = try tree.insert(val);
    std.debug.print("\n插入结点 {} 后，AVL 树为\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    _ = tree.remove(val);
    std.debug.print("\n删除结点 {} 后，AVL 树为\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver Code
pub fn main() !void {
    // 初始化空 AVL 树
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // 插入结点
    // 请关注插入结点后，AVL 树是如何保持平衡的
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

    // 插入重复结点
    try testInsert(i32, &avl_tree, 7);

    // 删除结点
    // 请关注删除结点后，AVL 树是如何保持平衡的
    testRemove(i32, &avl_tree, 8); // 删除度为 0 的结点
    testRemove(i32, &avl_tree, 5); // 删除度为 1 的结点
    testRemove(i32, &avl_tree, 4); // 删除度为 2 的结点    

    // 查找结点
    var node = avl_tree.search(7).?;
    std.debug.print("\n查找到的结点对象为 {any}，结点值 = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}