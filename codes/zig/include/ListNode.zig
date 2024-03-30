// File: ListNode.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 链表节点
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = 0,
        next: ?*Self = null,

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
        }
    };
}

// 将列表反序列化为链表
pub fn listToLinkedList(comptime T: type, mem_allocator: std.mem.Allocator, list: std.ArrayList(T)) !?*ListNode(T) {
    var dum = try mem_allocator.create(ListNode(T));
    dum.init(0);
    var head = dum;
    for (list.items) |val| {
        var tmp = try mem_allocator.create(ListNode(T));
        tmp.init(val);
        head.next = tmp;
        head = head.next.?;
    }
    return dum.next;
}

// 将数组反序列化为链表
pub fn arrToLinkedList(comptime T: type, mem_allocator: std.mem.Allocator, arr: []T) !?*ListNode(T) {
    var dum = try mem_allocator.create(ListNode(T));
    dum.init(0);
    var head = dum;
    for (arr) |val| {
        var tmp = try mem_allocator.create(ListNode(T));
        tmp.init(val);
        head.next = tmp;
        head = head.next.?;
    }
    return dum.next;
}