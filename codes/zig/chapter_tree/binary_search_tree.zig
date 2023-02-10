// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二叉搜索树
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 内存分配器

        // 构造方法
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.sort.sort(T, nums, {}, comptime std.sort.asc(T));   // 排序数组
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // 构建二叉搜索树
        }

        // 析构方法
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 构建二叉搜索树
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // 将数组中间结点作为根结点
            var mid = (i + j) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // 递归建立左子树和右子树
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // 获取二叉树根结点
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // 查找结点
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 循环查找，越过叶结点后跳出
            while (cur != null) {
                // 目标结点在 cur 的右子树中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 目标结点在 cur 的左子树中
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // 找到目标结点，跳出循环
                } else {
                    break;
                }
            }
            // 返回目标结点
            return cur;
        }

        // 插入结点
        fn insert(self: *Self, num: T) !?*inc.TreeNode(T) {
            // 若树为空，直接提前返回
            if (self.root == null) return null;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 循环查找，越过叶结点后跳出
            while (cur != null) {
                // 找到重复结点，直接返回
                if (cur.?.val == num) return null;
                pre = cur;
                // 插入位置在 cur 的右子树中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 插入位置在 cur 的左子树中
                } else {
                    cur = cur.?.left;
                }
            }
            // 插入结点 val
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
            return node;
        }

        // 删除结点
        fn remove(self: *Self, num: T) ?*inc.TreeNode(T) {
            // 若树为空，直接提前返回
            if (self.root == null) return null;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 循环查找，越过叶结点后跳出
            while (cur != null) {
                // 找到待删除结点，跳出循环
                if (cur.?.val == num) break;
                pre = cur;
                // 待删除结点在 cur 的右子树中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 待删除结点在 cur 的左子树中
                } else {
                    cur = cur.?.left;
                }
            }
            // 若无待删除结点，则直接返回
            if (cur == null) return null;
            // 子结点数量 = 0 or 1
            if (cur.?.left == null or cur.?.right == null) {
                // 当子结点数量 = 0 / 1 时， child = null / 该子结点
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // 删除结点 cur
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // 子结点数量 = 2
            } else {
                // 获取中序遍历中 cur 的下一个结点
                var nex = self.getInOrderNext(cur.?.right);
                var tmp = nex.?.val;
                // 递归删除结点 nex
                _ = self.remove(nex.?.val);
                // 将 nex 的值复制给 cur
                cur.?.val = tmp;
            }
            return cur;
        }

        // 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况）
        fn getInOrderNext(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            _ = self;
            var node_tmp = node;
            if (node_tmp == null) return null;
            // 循环访问左子结点，直到叶结点时为最小结点，跳出
            while (node_tmp.?.left != null) {
                node_tmp = node_tmp.?.left;
            }
            return node_tmp;
        }
    };   
}

// Driver Code
pub fn main() !void {
    // 初始化二叉树
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("初始化的二叉树为\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 查找结点
    var node = bst.search(7);
    std.debug.print("\n查找到的结点对象为 {any}，结点值 = {}\n", .{node, node.?.val});

    // 插入结点
    node = try bst.insert(16);
    std.debug.print("\n插入结点 16 后，二叉树为\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 删除结点
    _ = bst.remove(1);
    std.debug.print("\n删除结点 1 后，二叉树为\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    _ = bst.remove(2);
    std.debug.print("\n删除结点 2 后，二叉树为\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    _ = bst.remove(4);
    std.debug.print("\n删除结点 4 后，二叉树为\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}