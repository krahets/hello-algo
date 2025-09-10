// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;

// 在鏈結串列的節點 n0 之後插入節點 P
pub fn insert(comptime T: type, n0: *ListNode(T), P: *ListNode(T)) void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

// 刪除鏈結串列的節點 n0 之後的首個節點
pub fn remove(comptime T: type, n0: *ListNode(T)) void {
    // n0 -> P -> n1 => n0 -> n1
    const P = n0.next;
    const n1 = P.?.next;
    n0.next = n1;
}

// 訪問鏈結串列中索引為 index 的節點
pub fn access(comptime T: type, node: *ListNode(T), index: i32) ?*ListNode(T) {
    var head: ?*ListNode(T) = node;
    var i: i32 = 0;
    while (i < index) : (i += 1) {
        if (head) |cur| {
            head = cur.next;
        } else {
            return null;
        }
    }
    return head;
}

// 在鏈結串列中查詢值為 target 的首個節點
pub fn find(comptime T: type, node: *ListNode(T), target: T) i32 {
    var head: ?*ListNode(T) = node;
    var index: i32 = 0;
    while (head) |cur| {
        if (cur.val == target) return index;
        head = cur.next;
        index += 1;
    }
    return -1;
}

// Driver Code
pub fn run() void {
    // 初始化各個節點
    var n0 = ListNode(i32){ .val = 1 };
    var n1 = ListNode(i32){ .val = 3 };
    var n2 = ListNode(i32){ .val = 2 };
    var n3 = ListNode(i32){ .val = 5 };
    var n4 = ListNode(i32){ .val = 4 };
    // 構建節點之間的引用
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print(
        "初始化的鏈結串列為 {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 插入節點
    var tmp = ListNode(i32){ .val = 0 };
    insert(i32, &n0, &tmp);
    std.debug.print(
        "插入節點後的鏈結串列為 {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 刪除節點
    remove(i32, &n0);
    std.debug.print(
        "刪除節點後的鏈結串列為{}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 訪問節點
    const node = access(i32, &n0, 3);
    std.debug.print(
        "鏈結串列中索引 3 處的節點的值 = {}\n",
        .{node.?.val},
    );

    // 查詢節點
    const index = find(i32, &n0, 2);
    std.debug.print(
        "鏈結串列中值為 2 的節點的索引 = {}\n",
        .{index},
    );

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "linked_list" {
    run();
}
