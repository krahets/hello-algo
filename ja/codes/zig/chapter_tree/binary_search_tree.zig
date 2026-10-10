// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二分探索木
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // メモリアロケータ

        // コンストラクタ
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // 配列をソート
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // 二分探索木を構築
        }

        // デストラクタメソッド
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 二分探索木を構築
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // 配列の中央ノードを根ノードとする
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // 左部分木と右部分木を再帰的に構築する
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // 二分木の根ノードを取得
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // ノードを探索
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // ループで探索し、葉ノードを越えたら抜ける
            while (cur != null) {
                // 目標ノードは cur の右部分木にある
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 目標ノードは cur の左部分木にある
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // 目標ノードが見つかったらループを抜ける
                } else {
                    break;
                }
            }
            // 目標ノードを返す
            return cur;
        }

        // ノードを挿入
        fn insert(self: *Self, num: T) !void {
            // 木が空なら、根ノードを初期化する
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // ループで探索し、葉ノードを越えたら抜ける
            while (cur != null) {
                // 重複ノードが見つかったら、直ちに返す
                if (cur.?.val == num) return;
                pre = cur;
                // 挿入位置は cur の右部分木にある
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 挿入位置は cur の左部分木にある
                } else {
                    cur = cur.?.left;
                }
            }
            // ノードを挿入
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // ノードを削除
        fn remove(self: *Self, num: T) void {
            // 木が空なら、そのまま早期リターンする
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // ループで探索し、葉ノードを越えたら抜ける
            while (cur != null) {
                // 削除対象のノードが見つかったら、ループを抜ける
                if (cur.?.val == num) break;
                pre = cur;
                // 削除対象ノードは cur の右部分木にある
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 削除対象ノードは cur の左部分木にある
                } else {
                    cur = cur.?.left;
                }
            }
            // 削除対象ノードがなければそのまま返す
            if (cur == null) return;
            // 子ノード数 = 0 or 1
            if (cur.?.left == null or cur.?.right == null) {
                // 子ノード数が 0 / 1 のとき、child = null / その子ノード
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // ノード cur を削除する
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // 子ノード数 = 2
            } else {
                // 中順走査における cur の次ノードを取得
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // ノード tmp を再帰的に削除
                self.remove(tmp.?.val);
                // tmp で cur を上書きする
                cur.?.val = tmp_val;
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // 二分木を初期化
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("初期化された二分木は\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // ノードを探索
    var node = bst.search(7);
    std.debug.print("\n見つかったノードオブジェクトは {any}，ノードの値 = {}\n", .{node, node.?.val});

    // ノードを挿入
    try bst.insert(16);
    std.debug.print("\nノード 16 を挿入した後，二分木は\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // ノードを削除
    bst.remove(1);
    std.debug.print("\nノード 1 を削除した後，二分木は\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\nノード 2 を削除した後，二分木は\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\nノード 4 を削除した後，二分木は\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
