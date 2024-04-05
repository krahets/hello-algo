// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 在鏈結串列的節點 n0 之後插入節點 P
pub fn insert(n0: ?*inc.ListNode(i32), P: ?*inc.ListNode(i32)) void {
    var n1 = n0.?.next;
    P.?.next = n1;
    n0.?.next = P;
}

// 刪除鏈結串列的節點 n0 之後的首個節點
pub fn remove(n0: ?*inc.ListNode(i32)) void {
    if (n0.?.next == null) return;
    // n0 -> P -> n1
    var P = n0.?.next;
    var n1 = P.?.next;
    n0.?.next = n1;
}

// 訪問鏈結串列中索引為 index 的節點
pub fn access(node: ?*inc.ListNode(i32), index: i32) ?*inc.ListNode(i32) {
    var head = node;
    var i: i32 = 0;
    while (i < index) : (i += 1) {
        head = head.?.next;
        if (head == null) return null;
    }
    return head;
}

// 在鏈結串列中查詢值為 target 的首個節點
pub fn find(node: ?*inc.ListNode(i32), target: i32) i32 {
    var head = node;
    var index: i32 = 0;
    while (head != null) {
        if (head.?.val == target) return index;
        head = head.?.next;
        index += 1;
    }
    return -1;
}

// Driver Code
pub fn main() !void {
    // 初始化鏈結串列
    // 初始化各個節點 
    var n0 = inc.ListNode(i32){.val = 1};
    var n1 = inc.ListNode(i32){.val = 3};
    var n2 = inc.ListNode(i32){.val = 2};
    var n3 = inc.ListNode(i32){.val = 5};
    var n4 = inc.ListNode(i32){.val = 4};
    // 構建節點之間的引用
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print("初始化的鏈結串列為", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 插入節點
    var tmp = inc.ListNode(i32){.val = 0};
    insert(&n0, &tmp);
    std.debug.print("插入節點後的鏈結串列為", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 刪除節點
    remove(&n0);
    std.debug.print("刪除節點後的鏈結串列為", .{});
    try inc.PrintUtil.printLinkedList(i32, &n0);

    // 訪問節點
    var node = access(&n0, 3);
    std.debug.print("鏈結串列中索引 3 處的節點的值 = {}\n", .{node.?.val});

    // 查詢節點
    var index = find(&n0, 2);
    std.debug.print("鏈結串列中值為 2 的節點的索引 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}