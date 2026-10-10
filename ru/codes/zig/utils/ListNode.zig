// File: ListNode.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Узел связного списка
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

// Десериализовать список в связный список
pub fn listToLinkedList(comptime T: type, allocator: std.mem.Allocator, list: std.ArrayList(T)) !?*ListNode(T) {
    var dum = try allocator.create(ListNode(T));
    dum.init(0);
    var head = dum;
    for (list.items) |val| {
        var tmp = try allocator.create(ListNode(T));
        tmp.init(val);
        head.next = tmp;
        head = head.next.?;
    }
    return dum.next;
}

// Десериализовать массив в связный список
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
