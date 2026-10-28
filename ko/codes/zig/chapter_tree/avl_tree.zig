// File: avl_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// AVL 트리
pub fn AVLTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,                 // 루트 노드
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 메모리 할당자

        // 생성자
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
        }

        // 소멸자
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 노드 높이 반환
        fn height(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            _ = self;
            // 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
            return if (node == null) -1 else node.?.height;
        }

        // 노드 높이를 갱신한다
        fn updateHeight(self: *Self, node: ?*inc.TreeNode(T)) void {
            // 노드 높이는 가장 높은 서브트리의 높이 + 1이다
            node.?.height = @max(self.height(node.?.left), self.height(node.?.right)) + 1;
        }

        // 균형 인수 반환
        fn balanceFactor(self: *Self, node: ?*inc.TreeNode(T)) i32 {
            // 빈 노드의 균형 인수는 0이다
            if (node == null) return 0;
            // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
            return self.height(node.?.left) - self.height(node.?.right);
        }

        // 오른쪽 회전 연산
        fn rightRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.left;
            var grandChild = child.?.right;
            // child를 중심으로 node를 오른쪽으로 회전한다
            child.?.right = node;
            node.?.left = grandChild;
            // 노드 높이를 갱신한다
            self.updateHeight(node);
            self.updateHeight(child);
            // 회전한 서브트리의 루트 노드를 반환한다
            return child;
        }

        // 왼쪽 회전 연산
        fn leftRotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            var child = node.?.right;
            var grandChild = child.?.left;
            // child를 중심으로 node를 왼쪽으로 회전한다
            child.?.left = node;
            node.?.right = grandChild;
            // 노드 높이를 갱신한다
            self.updateHeight(node);
            self.updateHeight(child);
            // 회전한 서브트리의 루트 노드를 반환한다
            return child;
        }

        // 회전 연산을 수행하여 해당 서브트리의 균형 복원
        fn rotate(self: *Self, node: ?*inc.TreeNode(T)) ?*inc.TreeNode(T) {
            // 노드 node의 균형 인수를 구한다
            var balance_factor = self.balanceFactor(node);
            // 왼쪽으로 치우친 트리
            if (balance_factor > 1) {
                if (self.balanceFactor(node.?.left) >= 0) {
                    // 오른쪽 회전
                    return self.rightRotate(node);
                } else {
                    // 왼쪽으로 회전한 후 오른쪽으로 회전한다
                    node.?.left = self.leftRotate(node.?.left);
                    return self.rightRotate(node);
                }
            }
            // 오른쪽으로 치우친 트리
            if (balance_factor < -1) {
                if (self.balanceFactor(node.?.right) <= 0) {
                    // 왼쪽 회전
                    return self.leftRotate(node);
                } else {
                    // 오른쪽으로 회전한 후 왼쪽으로 회전한다
                    node.?.right = self.rightRotate(node.?.right);
                    return self.leftRotate(node);
                }
            }
            // 균형 트리이므로 회전할 필요 없이 바로 반환한다
            return node;
        }

        // 노드 삽입
        fn insert(self: *Self, val: T) !void {
            self.root = (try self.insertHelper(self.root, val)).?;
        }

        // 노드의 재귀적 삽입(보조 메서드)
        fn insertHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) !?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) {
                var tmp_node = try self.mem_allocator.create(inc.TreeNode(T));
                tmp_node.init(val);
                return tmp_node;
            }
            // 1. 삽입 위치를 찾아 노드를 삽입한다
            if (val < node.?.val) {
                node.?.left = try self.insertHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = try self.insertHelper(node.?.right, val);
            } else {
                return node;            // 중복 노드는 삽입하지 않고 바로 반환한다
            }
            self.updateHeight(node);    // 노드 높이를 갱신한다
            // 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다
            node = self.rotate(node);
            // 서브트리의 루트 노드를 반환한다
            return node;
        }

        // 노드 삭제
        fn remove(self: *Self, val: T) void {
           self.root = self.removeHelper(self.root, val).?;
        }

        // 노드의 재귀적 삭제(보조 메서드)
        fn removeHelper(self: *Self, node_: ?*inc.TreeNode(T), val: T) ?*inc.TreeNode(T) {
            var node = node_;
            if (node == null) return null;
            // 1. 노드를 찾아 삭제한다
            if (val < node.?.val) {
                node.?.left = self.removeHelper(node.?.left, val);
            } else if (val > node.?.val) {
                node.?.right = self.removeHelper(node.?.right, val);
            } else {
                if (node.?.left == null or node.?.right == null) {
                    var child = if (node.?.left != null) node.?.left else node.?.right;
                    // 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
                    if (child == null) {
                        return null;
                    // 자식 노드 수 = 1이면 node를 바로 삭제한다
                    } else {
                        node = child;
                    }
                } else {
                    // 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
                    var temp = node.?.right;
                    while (temp.?.left != null) {
                        temp = temp.?.left;
                    }
                    node.?.right = self.removeHelper(node.?.right, temp.?.val);
                    node.?.val = temp.?.val;
                }
            }
            self.updateHeight(node); // 노드 높이를 갱신한다
            // 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다
            node = self.rotate(node);
            // 서브트리의 루트 노드를 반환한다
            return node;
        }

        // 노드 탐색
        fn search(self: *Self, val: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 반복하여 탐색하다 리프 노드를 지나면 종료한다
            while (cur != null) {
                // 목표 노드는 cur의 오른쪽 서브트리에 있다
                if (cur.?.val < val) {
                    cur = cur.?.right;
                // 목표 노드는 cur의 왼쪽 서브트리에 있다
                } else if (cur.?.val > val) {
                    cur = cur.?.left;
                // 목표 노드를 찾았으므로 반복문을 종료한다
                } else {
                    break;
                }
            }
            // 목표 노드를 반환한다
            return cur;
        }
    };   
}

pub fn testInsert(comptime T: type, tree_: *AVLTree(T), val: T) !void {
    var tree = tree_;
    try tree.insert(val);
    std.debug.print("\n노드 {} 삽입 후의 AVL 트리:\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

pub fn testRemove(comptime T: type, tree_: *AVLTree(T), val: T) void {
    var tree = tree_;
    tree.remove(val);
    std.debug.print("\n노드 {} 삭제 후의 AVL 트리:\n", .{val});
    try inc.PrintUtil.printTree(tree.root, null, false);
}

// 실행 코드
pub fn main() !void {
    // 빈 AVL 트리 초기화
    var avl_tree = AVLTree(i32){};
    avl_tree.init(std.heap.page_allocator);
    defer avl_tree.deinit();

    // 노드 삽입
    // 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
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

    // 중복 노드 삽입
    try testInsert(i32, &avl_tree, 7);

    // 노드 삭제
    // 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    testRemove(i32, &avl_tree, 8); // 차수가 0인 노드 삭제
    testRemove(i32, &avl_tree, 5); // 차수가 1인 노드 삭제
    testRemove(i32, &avl_tree, 4); // 차수가 2인 노드 삭제    

    // 노드 탐색
    var node = avl_tree.search(7).?;
    std.debug.print("\n찾은 노드 객체: {any}, 노드 값 = {}\n", .{node, node.val});

    _ = try std.io.getStdIn().reader().readByte();
}