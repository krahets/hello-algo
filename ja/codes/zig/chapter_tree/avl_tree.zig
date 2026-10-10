// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL 木
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // 根ノード
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // メモリアロケータ

        // コンストラクタ
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // デストラクタメソッド
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // ノードの高さを取得
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // 空ノードの高さは -1、葉ノードの高さは 0
            return if (node == null) -1 else node.?.height;
        }

        // ノードの高さを更新する
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // ノードの高さは最も高い部分木の高さ + 1 に等しい
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // 平衡係数を取得
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // 空ノードの平衡係数は 0
            if (node == null) return 0;
            // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // 右回転
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // child を支点として node を右回転させる
            child.?.right = node;
            node.?.left = grandChild;
            // ノードの高さを更新する
            self.updateHeight(node);
            self.updateHeight(child);
            // 回転後の部分木の根ノードを返す
            return child;
        }

        // 左回転
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // child を支点として node を左回転させる
            child.?.left = node;
            node.?.right = grandChild;
            // ノードの高さを更新する
            self.updateHeight(node);
            self.updateHeight(child);
            // 回転後の部分木の根ノードを返す
            return child;
        }

        // 回転操作を行い、この部分木の平衡を回復する
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // ノード node の平衡係数を取得
            var balance_factor = self.balanceFactor(node);
            // 左に偏った木
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // 右回転
                    return self.rightRotate(node);
                } else {
                    // 左回転してから右回転
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // 右に偏った木
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // 左回転
                    return self.leftRotate(node);
                } else {
                    // 右回転してから左回転
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // 平衡木なので回転不要、そのまま返す
            return node;
        }

        // ノードを挿入
        fn insert(self: *Self, val: T) !void {
            self.root = (try self.insertHelper(self.root, val)).?;
        }

        // ノードを再帰的に挿入する（補助メソッド）
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. 挿入位置を探索してノードを挿入
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // 重複ノードは挿入せず、そのまま返す
            }
            self.updateHeight(node);    // ノードの高さを更新する
            // 2. 回転操作を行い、部分木の平衡を回復する
            node = self.rotate(node);
            // 部分木の根ノードを返す
            return node;
        }

        // ノードを削除
        fn remove(self: *Self, val: T) void {
           self.root = self.removeHelper(self.root, val).?;
        }

        // ノードを再帰的に削除する（補助メソッド）
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. ノードを探索して削除
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // 子ノード数 = 0 の場合、node をそのまま削除して返す
                    if (child == null) {
                        return null;
                    // 子ノード数 = 1 の場合、node をそのまま削除する
                    } else {
                        node = child;
                    }
                } else {
                    // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // ノードの高さを更新する
            // 2. 回転操作を行い、部分木の平衡を回復する
            node = self.rotate(node);
            // 部分木の根ノードを返す
            return node;
        }

        // ノードを探索
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // ループで探索し、葉ノードを越えたら抜ける
            while (cur != null) {
                // 目標ノードは cur の右部分木にある
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // 目標ノードは cur の左部分木にある
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // 目標ノードが見つかったらループを抜ける
                } else {
                    break;
                }
            }
            // 目標ノードを返す
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    try tree.insert(val);
    std.debug.print("\nノード {} を挿入した後，AVL 木は\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\nノード {} を削除した後，AVL 木は\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver Code
pub fn main() !void {
    // 空の AVL 木を初期化する
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // ノードを挿入する
    // ノード挿入後に AVL 木がどのように平衡を保つかに注目
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

    // 重複ノードを挿入する
    try testInsert(i32, &avl_tree, 7);

    // ノードを削除する
    // ノード削除後に AVL 木がどのように平衡を保つかに注目
    testRemove(i32, &avl_tree, 8); // 次数 0 のノードを削除する
    testRemove(i32, &avl_tree, 5); // 次数 1 のノードを削除する
    testRemove(i32, &avl_tree, 4); // 次数 2 のノードを削除する

    // ノードを探索
    var node = avl_tree.search(7).?;
    std.debug.print("\n見つかったノードオブジェクトは {any}，ノードの値 = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}