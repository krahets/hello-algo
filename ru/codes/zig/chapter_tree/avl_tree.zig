// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL-дерево
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // корневой узел
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Распределитель памяти

        // Конструктор
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // Деструктор
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получить высоту узла
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // Высота пустого узла равна -1, а высота листа равна 0
            return if (node == null) -1 else node.?.height;
        }

        // Обновить высоту узла
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // Высота узла равна высоте более высокого поддерева + 1
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // Получить коэффициент баланса
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // Баланс-фактор пустого узла равен 0
            if (node == null) return 0;
            // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // Операция правого поворота
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // Используя child как опорную точку, выполнить правый поворот node
            child.?.right = node;
            node.?.left = grandChild;
            // Обновить высоту узла
            self.updateHeight(node);
            self.updateHeight(child);
            // Вернуть корневой узел поддерева после вращения
            return child;
        }

        // Операция левого поворота
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // Используя child как опорную точку, выполнить левый поворот node
            child.?.left = node;
            node.?.right = grandChild;
            // Обновить высоту узла
            self.updateHeight(node);
            self.updateHeight(child);
            // Вернуть корневой узел поддерева после вращения
            return child;
        }

        // Выполнить поворот, чтобы восстановить баланс этого поддерева
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // Получить коэффициент баланса узла node
            var balance_factor = self.balanceFactor(node);
            // Левосторонне перекошенное дерево
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // Правый поворот
                    return self.rightRotate(node);
                } else {
                    // Сначала выполнить левый поворот, затем правый
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // Правосторонне перекошенное дерево
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // Левый поворот
                    return self.leftRotate(node);
                } else {
                    // Сначала выполнить правый поворот, затем левый
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
            return node;
        }

        // Вставить узел
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
                return node;            // Дублирующийся узел не вставлять, сразу вернуть результат
            }
            self.updateHeight(node);    // Обновить высоту узла
            // 2. Выполнить вращение, чтобы снова сбалансировать это поддерево
            node = self.rotate(node);
            // Вернуть корневой узел поддерева
            return node;
        }

        // Удалить узел
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
                    // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                    if (child == null) {
                        return null;
                    // Если число дочерних узлов равно 1, сразу удалить node
                    } else {
                        node = child;
                    }
                } else {
                    // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // Обновить высоту узла
            // 2. Выполнить вращение, чтобы снова сбалансировать это поддерево
            node = self.rotate(node);
            // Вернуть корневой узел поддерева
            return node;
        }

        // Найти узел
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // Выполнять поиск в цикле и выйти после прохождения листового узла
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
    std.debug.print("\nПосле вставки узла {} AVL-дерево имеет вид\n",.{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\nПосле удаления узла {} AVL-дерево имеет вид\n",.{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// Driver Code
pub fn main() !void {
    // Инициализировать пустое AVL-дерево
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // Вставка узла
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
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

    // Вставить повторяющийся узел
    try testInsert(i32, &avl_tree, 7);

    // Удаление узла
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(i32, &avl_tree, 8); // Удалить узел степени 0
    testRemove(i32, &avl_tree, 5); // Удалить узел степени 1
    testRemove(i32, &avl_tree, 4); // Удалить узел степени 2

    // Найти узел
    var node = avl_tree.search(7).?;
    std.debug.print("\nНайденный объект узла равен {any}, значение узла = {}\n",.{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}
