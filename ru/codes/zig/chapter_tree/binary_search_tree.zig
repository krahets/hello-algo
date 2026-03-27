// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Двоичное дерево поиска
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Аллокатор памяти

        // Конструктор
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // Отсортировать массив
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // Построить двоичное дерево поиска
        }

        // Метод-деструктор
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Построить двоичное дерево поиска
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // Использовать средний узел массива как корневой узел
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // Рекурсивно построить левое и правое поддеревья
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // Получить корневой узел двоичного дерева
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // Поиск узла
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // Искать в цикле и выйти после прохода за листовой узел
            while (cur != null) {
                // Целевой узел находится в правом поддереве cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // Целевой узел находится в левом поддереве cur
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // Найти целевой узел и выйти из цикла
                } else {
                    break;
                }
            }
            // Вернуть целевой узел
            return cur;
        }

        // Вставка узла
        fn insert(self: *Self, num: T) !void {
            // Если дерево пусто, инициализировать корневой узел
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // Искать в цикле и выйти после прохода за листовой узел
            while (cur != null) {
                // Найти повторяющийся узел и сразу вернуть
                if (cur.?.val == num) return;
                pre = cur;
                // Позиция вставки находится в правом поддереве cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // Позиция вставки находится в левом поддереве cur
                } else {
                    cur = cur.?.left;
                }
            }
            // Вставка узла
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // Удаление узла
        fn remove(self: *Self, num: T) void {
            // Если дерево пусто, сразу вернуть
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // Искать в цикле и выйти после прохода за листовой узел
            while (cur != null) {
                // Найти узел для удаления и выйти из цикла
                if (cur.?.val == num) break;
                pre = cur;
                // Узел для удаления находится в правом поддереве cur
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // Узел для удаления находится в левом поддереве cur
                } else {
                    cur = cur.?.left;
                }
            }
            // Если узел для удаления отсутствует, сразу вернуть
            if (cur == null) return;
            // Число дочерних узлов = 0 или 1
            if (cur.?.left == null or cur.?.right == null) {
                // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // Удалить узел cur
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // Число дочерних узлов = 2
            } else {
                // Получить следующий узел после cur в симметричном обходе
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // Рекурсивно удалить узел tmp
                self.remove(tmp.?.val);
                // Перезаписать cur значением tmp
                cur.?.val = tmp_val;
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализация двоичного дерева
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("Инициализированное двоичное дерево\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // Поиск узла
    var node = bst.search(7);
    std.debug.print("\nНайденный объект узла = {any}, значение узла = {}\n", .{node, node.?.val});

    // Вставка узла
    try bst.insert(16);
    std.debug.print("\nПосле вставки узла 16 двоичное дерево имеет вид\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // Удаление узла
    bst.remove(1);
    std.debug.print("\nПосле удаления узла 1 двоичное дерево имеет вид\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\nПосле удаления узла 2 двоичное дерево имеет вид\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\nПосле удаления узла 4 двоичное дерево имеет вид\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
