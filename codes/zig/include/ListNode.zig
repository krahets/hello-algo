// File: ListNode.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// Definition for a singly-linked list node
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,
        next: ?*Self = null,

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
        }
    };
}

// Generate a linked list with a list
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

// Generate a linked list with an array
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