// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL 樹
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // 根節點
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 記憶體分配器

        // 建構子
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // 析構方法
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 獲取節點高度
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // 空節點高度為 -1 ，葉節點高度為 0
            return if (node == null) -1 else node.?.height;
        }

        // 更新節點高度
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // 節點高度等於最高子樹高度 + 1
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // 獲取平衡因子
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // 空節點平衡因子為 0
            if (node == null) return 0;
            // 節點平衡因子 = 左子樹高度 - 右子樹高度
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // 右旋操作
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // 以 child 為原點，將 node 向右旋轉
            child.?.right = node;
            node.?.left = grandChild;
            // 更新節點高度
            self.updateHeight(node);
            self.updateHeight(child);
            // 返回旋轉後子樹的根節點
            return child;
        }

        // 左旋操作
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // 以 child 為原點，將 node 向左旋轉
            child.?.left = node;
            node.?.right = grandChild;
            // 更新節點高度
            self.updateHeight(node);
            self.updateHeight(child);
            // 返回旋轉後子樹的根節點
            return child;
        }

        // 執行旋轉操作，使該子樹重新恢復平衡
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // 獲取節點 node 的平衡因子
            var balance_factor = self.balanceFactor(node);
            // 左偏樹
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // 右旋
                    return self.rightRotate(node);
                } else {
                    // 先左旋後右旋
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // 右偏樹
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // 左旋
                    return self.leftRotate(node);
                } else {
                    // 先右旋後左旋
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // 平衡樹，無須旋轉，直接返回
            return node;
        }

        // 插入節點
        fn insert(self: *Self, val: T) !void {
            self.root = (try self.insertHelper(self.root, val)).?;
        }

        // 遞迴插入節點（輔助方法）
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. 查詢插入位置並插入節點
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // 重複節點不插入，直接返回
            }
            self.updateHeight(node);    // 更新節點高度
            // 2. 執行旋轉操作，使該子樹重新恢復平衡
            node = self.rotate(node);
            // 返回子樹的根節點
            return node;
        }

        // 刪除節點
        fn remove(self: *Self, val: T) void {
           self.root = self.removeHelper(self.root, val).?;
        }

        // 遞迴刪除節點（輔助方法）
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. 查詢節點並刪除
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // 子節點數量 = 0 ，直接刪除 node 並返回
                    if (child == null) {
                        return null;
                    // 子節點數量 = 1 ，直接刪除 node
                    } else {
                        node = child;
                    }
                } else {
                    // 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // 更新節點高度
            // 2. 執行旋轉操作，使該子樹重新恢復平衡
            node = self.rotate(node);
            // 返回子樹的根節點
            return node;
        }

        // 查詢節點
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 迴圈查詢，越過葉節點後跳出
            while (cur != null) {
                // 目標節點在 cur 的右子樹中
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // 目標節點在 cur 的左子樹中
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // 找到目標節點，跳出迴圈
                } else {
                    break;
                }
            }
            // 返回目標節點
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    try tree.insert(val);
    std.debug.print("\n插入節點 {} 後，AVL 樹為\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\n刪除節點 {} 後，AVL 樹為\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver Code
pub fn main() !void {
    // 初始化空 AVL 樹
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // 插入節點
    // 請關注插入節點後，AVL 樹是如何保持平衡的
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

    // 插入重複節點
    try testInsert(i32, &avl_tree, 7);

    // 刪除節點
    // 請關注刪除節點後，AVL 樹是如何保持平衡的
    testRemove(i32, &avl_tree, 8); // 刪除度為 0 的節點
    testRemove(i32, &avl_tree, 5); // 刪除度為 1 的節點
    testRemove(i32, &avl_tree, 4); // 刪除度為 2 的節點    

    // 查詢節點
    var node = avl_tree.search(7).?;
    std.debug.print("\n查詢到的節點物件為 {any}，節點值 = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}