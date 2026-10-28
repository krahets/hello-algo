// File: binary_search_tree.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 이진 탐색 트리
pub fn BinarySearchTree(comptime T: type) type {
    return struct {
        const Self = @This();

        root: ?*inc.TreeNode(T) = null,
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // 메모리 할당자

        // 생성자
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []T) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            std.mem.sort(T, nums, {}, comptime std.sort.asc(T));   // 배열 정렬
            self.root = try self.buildTree(nums, 0, nums.len - 1);  // 이진 탐색 트리 구성
        }

        // 소멸자
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 이진 탐색 트리 구성
        fn buildTree(self: *Self, nums: []T, i: usize, j: usize) !?*inc.TreeNode(T) {
            if (i > j) return null;
            // 배열의 가운데 노드를 루트 노드로 삼는다
            var mid = i + (j - i) / 2;
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(nums[mid]);
            // 왼쪽 서브트리와 오른쪽 서브트리를 재귀적으로 구성한다
            if (mid >= 1) node.left = try self.buildTree(nums, i, mid - 1);
            node.right = try self.buildTree(nums, mid + 1, j);
            return node;
        }

        // 이진 트리의 루트 노드 반환
        fn getRoot(self: *Self) ?*inc.TreeNode(T) {
            return self.root;
        }

        // 노드 탐색
        fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
            var cur = self.root;
            // 반복하여 탐색하다 리프 노드를 지나면 종료한다
            while (cur != null) {
                // 목표 노드는 cur의 오른쪽 서브트리에 있다
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 목표 노드는 cur의 왼쪽 서브트리에 있다
                } else if (cur.?.val > num) {
                    cur = cur.?.left;
                // 목표 노드를 찾았으므로 반복문을 종료한다
                } else {
                    break;
                }
            }
            // 목표 노드를 반환한다
            return cur;
        }

        // 노드 삽입
        fn insert(self: *Self, num: T) !void {
            // 트리가 비어 있으면 루트 노드를 초기화한다
            if (self.root == null) {
                self.root = try self.mem_allocator.create(inc.TreeNode(T));
                return;
            }
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 반복하여 탐색하다 리프 노드를 지나면 종료한다
            while (cur != null) {
                // 중복 노드를 찾으면 바로 반환한다
                if (cur.?.val == num) return;
                pre = cur;
                // 삽입 위치는 cur의 오른쪽 서브트리에 있다
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 삽입 위치는 cur의 왼쪽 서브트리에 있다
                } else {
                    cur = cur.?.left;
                }
            }
            // 노드 삽입
            var node = try self.mem_allocator.create(inc.TreeNode(T));
            node.init(num);
            if (pre.?.val < num) {
                pre.?.right = node;
            } else {
                pre.?.left = node;
            }
        }

        // 노드 삭제
        fn remove(self: *Self, num: T) void {
            // 트리가 비어 있으면 바로 반환하여 종료한다
            if (self.root == null) return;
            var cur = self.root;
            var pre: ?*inc.TreeNode(T) = null;
            // 반복하여 탐색하다 리프 노드를 지나면 종료한다
            while (cur != null) {
                // 삭제할 노드를 찾았으므로 반복문을 종료한다
                if (cur.?.val == num) break;
                pre = cur;
                // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
                if (cur.?.val < num) {
                    cur = cur.?.right;
                // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
                } else {
                    cur = cur.?.left;
                }
            }
            // 삭제할 노드가 없으면 바로 반환한다
            if (cur == null) return;
            // 자식 노드 수 = 0 또는 1
            if (cur.?.left == null or cur.?.right == null) {
                // 자식 노드 수 = 0 / 1이면 child = null / 해당 자식 노드이다
                var child = if (cur.?.left != null) cur.?.left else cur.?.right;
                // 노드 cur를 삭제한다
                if (pre.?.left == cur) {
                    pre.?.left = child;
                } else {
                    pre.?.right = child;
                }
            // 자식 노드 수 = 2
            } else {
                // 중위 순회에서 cur의 다음 노드를 구한다
                var tmp = cur.?.right;
                while (tmp.?.left != null) {
                    tmp = tmp.?.left;
                }
                var tmp_val = tmp.?.val;
                // 노드 tmp를 재귀적으로 삭제한다
                self.remove(tmp.?.val);
                // tmp로 cur를 덮어쓴다
                cur.?.val = tmp_val;
            }
        }
    };
}

// 실행 코드
pub fn main() !void {
    // 이진 트리 초기화
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    var bst = BinarySearchTree(i32){};
    try bst.init(std.heap.page_allocator, &nums);
    defer bst.deinit();
    std.debug.print("초기화한 이진 트리:\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 노드 탐색
    var node = bst.search(7);
    std.debug.print("\n찾은 노드 객체: {any}, 노드 값 = {}\n", .{node, node.?.val});

    // 노드 삽입
    try bst.insert(16);
    std.debug.print("\n노드 16을 삽입한 후의 이진 트리\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    // 노드 삭제
    bst.remove(1);
    std.debug.print("\n노드 1을 삭제한 후의 이진 트리\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(2);
    std.debug.print("\n노드 2를 삭제한 후의 이진 트리\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);
    bst.remove(4);
    std.debug.print("\n노드 4를 삭제한 후의 이진 트리\n", .{});
    try inc.PrintUtil.printTree(bst.getRoot(), null, false);

    _ = try std.io.getStdIn().reader().readByte();
}
