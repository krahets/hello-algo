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
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // 配列をソートする
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // 二分探索木を構築する
        }

        // デストラクタ
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 二分探索木を構築する
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // 配列の中央のノードを根ノードとする
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // 左右の部分木を再帰的に構築する
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // 二分木の根ノードを取得する
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // ノードを探索する
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 繰り返し探索し、葉ノードを越えたら終了する
            while (cur != null) {
                // 目的のノードは cur の右部分木にある
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 目的のノードは cur の左部分木にある
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // 目的のノードが見つかったので、ループを終了する
                } else {
                    break;
                }
            }
            // 目的のノードを返す
            return cur;
        }

        // ノードを挿入する
        fn insert(self: *Self, num: T) !void {
            // 木が空の場合、根ノードを初期化する
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 繰り返し探索し、葉ノードを越えたら終了する
            while (cur != null) {
                // 重複したノードが見つかったので、そのまま戻る
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
            // ノードを挿入する
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // ノードを削除する
        fn remove(self: *Self, num: T) void {
            // 木が空の場合、そのまま早期リターンする
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 繰り返し探索し、葉ノードを越えたら終了する
            while (cur != null) {
                // 削除対象のノードが見つかったので、ループを終了する
                if (cur.?.val == num) break;
                pre = cur;
                // 削除対象のノードは cur の右部分木にある
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 削除対象のノードは cur の左部分木にある
                } else {
                    cur = cur.?.left;
                }
            }
            // 削除対象のノードが存在しない場合、そのまま戻る
            if (cur == null) return;
            // 子ノード数 = 0 または 1
            if (cur.?.left == null or cur.?.right == null) {
                // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // ノード cur を削除する
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // 子ノード数 = 2
            } else {
                // 通りがけ順で cur の次のノードを取得する
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // ノード tmp を再帰的に削除する
                self.remove(tmp.?.val);
                // tmp で cur を上書きする
                cur.?.val = tmp_val;
            }
        }
    };
}

// 実行用コード
pub fn main() !void {
    // 二分木を初期化する
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("初期化した二分木\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // ノードを探索する
    var node = bst.search(7);
    std.debug.print("\n見つかったノードオブジェクトは {any}、ノードの値 = {}\n", .{node, node.?.val});

    // ノードを挿入する
    try bst.insert(16);
    std.debug.print("\nノード 16 を挿入した後の二分木\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // ノードを削除する
    bst.remove(1);
    std.debug.print("\nノード 1 を削除した後の二分木\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\nノード 2 を削除した後の二分木\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\nノード 4 を削除した後の二分木\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
