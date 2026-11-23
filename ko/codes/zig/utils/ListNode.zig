// File: ListNode.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 연결 리스트 노드
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();

        val: T = 0,
        next: ?*Self = null,

        // 지정한 값으로 연결 리스트 노드를 초기화한다
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
        }
    };
}

// 리스트를 연결 리스트로 역직렬화
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

// 배열을 역직렬화하여 연결 리스트로 변환한다
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
