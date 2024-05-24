// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二元搜尋樹
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 記憶體分配器

        // 建構子
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // 排序陣列
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // 構建二元搜尋樹
        }

        // 析構方法
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 構建二元搜尋樹
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // 將陣列中間節點作為根節點
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // 遞迴建立左子樹和右子樹
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // 獲取二元樹根節點
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // 查詢節點
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 迴圈查詢，越過葉節點後跳出
            while (cur != null) {
                // 目標節點在 cur 的右子樹中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 目標節點在 cur 的左子樹中
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // 找到目標節點，跳出迴圈
                } else {
                    break;
                }
            }
            // 返回目標節點
            return cur;
        }

        // 插入節點
        fn insert(self: *Self, num: T) !void {
            // 若樹為空，則初始化根節點
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 迴圈查詢，越過葉節點後跳出
            while (cur != null) {
                // 找到重複節點，直接返回
                if (cur.?.val == num) return;
                pre = cur;
                // 插入位置在 cur 的右子樹中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 插入位置在 cur 的左子樹中
                } else {
                    cur = cur.?.left;
                }
            }
            // 插入節點
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // 刪除節點
        fn remove(self: *Self, num: T) void {
            // 若樹為空，直接提前返回
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 迴圈查詢，越過葉節點後跳出
            while (cur != null) {
                // 找到待刪除節點，跳出迴圈
                if (cur.?.val == num) break;
                pre = cur;
                // 待刪除節點在 cur 的右子樹中
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 待刪除節點在 cur 的左子樹中
                } else {
                    cur = cur.?.left;
                }
            }
            // 若無待刪除節點，則直接返回
            if (cur == null) return;
            // 子節點數量 = 0 or 1
            if (cur.?.left == null or cur.?.right == null) {
                // 當子節點數量 = 0 / 1 時， child = null / 該子節點
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // 刪除節點 cur
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // 子節點數量 = 2
            } else {
                // 獲取中序走訪中 cur 的下一個節點
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // 遞迴刪除節點 tmp
                self.remove(tmp.?.val);
                // 用 tmp 覆蓋 cur
                cur.?.val = tmp_val;
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // 初始化二元樹
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("初始化的二元樹為\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 查詢節點
    var node = bst.search(7);
    std.debug.print("\n查詢到的節點物件為 {any}，節點值 = {}\n", .{node, node.?.val});

    // 插入節點
    try bst.insert(16);
    std.debug.print("\n插入節點 16 後，二元樹為\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 刪除節點
    bst.remove(1);
    std.debug.print("\n刪除節點 1 後，二元樹為\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\n刪除節點 2 後，二元樹為\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\n刪除節點 4 後，二元樹為\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
