// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL-дерево
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // Корневой узел
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Аллокатор памяти

        // Конструктор
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // Метод-деструктор
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получить высоту узла
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // Высота пустого узла равна -1, высота листового узла равна 0
            return if (node == null) -1 else node.?.height;
        }

        // Обновить высоту узла
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // Высота узла равна высоте более высокого поддерева + 1
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // Получить коэффициент баланса
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // Коэффициент баланса пустого узла равен 0
            if (node == null) return 0;
            // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // Операция правого вращения
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // Выполнить правое вращение узла node вокруг child
            child.?.right = node;
            node.?.left = grandChild;
            // Обновить высоту узла
            self.updateHeight(node);
            self.updateHeight(child);
            // Вернуть корневой узел поддерева после вращения
            return child;
        }

        // Операция левого вращения
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // Выполнить левое вращение узла node вокруг child
            child.?.left = node;
            node.?.right = grandChild;
            // Обновить высоту узла
            self.updateHeight(node);
            self.updateHeight(child);
            // Вернуть корневой узел поддерева после вращения
            return child;
        }

        // Выполнить вращение, чтобы снова сбалансировать поддерево
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // Получить коэффициент баланса узла node
            var balance_factor = self.balanceFactor(node);
            // Левосторонне перекошенное дерево
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // Правое вращение
                    return self.rightRotate(node);
                } else {
                    // Сначала левое вращение, затем правое
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // Правосторонне перекошенное дерево
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // Левое вращение
                    return self.leftRotate(node);
                } else {
                    // Сначала правое вращение, затем левое
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // Дерево сбалансировано, вращение не требуется, вернуть сразу
            return node;
        }

        // Вставка узла
        fn insert(self: *Self, val: T) !void {
            self.root = (try self.insertHelper(self.root, val)).?;
        }

        // Рекурсивная вставка узла (вспомогательный метод)
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. Найти позицию вставки и вставить узел
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // Повторяющийся узел не вставлять, сразу вернуть
            }
            self.updateHeight(node);    // Обновить высоту узла
            // 2. Выполнить вращение, чтобы снова сбалансировать поддерево
            node = self.rotate(node);
            // Вернуть корневой узел поддерева
            return node;
        }

        // Удаление узла
        fn remove(self: *Self, val: T) void {
           self.root = self.removeHelper(self.root, val).?;
        }

        // Рекурсивное удаление узла (вспомогательный метод)
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. Найти узел и удалить его
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // Число дочерних узлов = 0, удалить node и сразу вернуть
                    if (child == null) {
                        return null;
                    // Число дочерних узлов = 1, удалить node напрямую
                    } else {
                        node = child;
                    }
                } else {
                    // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // Обновить высоту узла
            // 2. Выполнить вращение, чтобы снова сбалансировать поддерево
            node = self.rotate(node);
            // Вернуть корневой узел поддерева
            return node;
        }

        // Поиск узла
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // Искать в цикле и выйти после прохода за листовой узел
            while (cur != null) {
                // Целевой узел находится в правом поддереве cur
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // Целевой узел находится в левом поддереве cur
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // Найти целевой узел и выйти из цикла
                } else {
                    break;
                }
            }
            // Вернуть целевой узел
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    try tree.insert(val);
    std.debug.print("\nПосле вставки узла {} AVL-дерево имеет вид\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\nПосле удаления узла {} AVL-дерево имеет вид\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver Code
pub fn main() !void {
    // Инициализация пустого AVL-дерева
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // Вставка узла
    // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
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

    // Вставка повторяющегося узла
    try testInsert(i32, &avl_tree, 7);

    // Удаление узла
    // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(i32, &avl_tree, 8); // Удаление узла степени 0
    testRemove(i32, &avl_tree, 5); // Удаление узла степени 1
    testRemove(i32, &avl_tree, 4); // Удаление узла степени 2

    // Поиск узла
    var node = avl_tree.search(7).?;
    std.debug.print("\nНайденный объект узла = {any}, значение узла = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}