// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;

// Insert node P after node n0 in the linked list
pub fn insert(comptime T: type, n0: *ListNode(T), P: *ListNode(T)) void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

// Remove the first node after node n0 in the linked list
pub fn remove(comptime T: type, n0: *ListNode(T)) void {
    // n0 -> P -> n1 => n0 -> n1
    const P = n0.next;
    const n1 = P.?.next;
    n0.next = n1;
}

// Access the node at index `index` in the linked list
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

// Find the first node with value target in the linked list
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

// Driver code
pub fn run() void {
    // Initialize the individual nodes
    var n0 = ListNode(i32){ .val = 1 };
    var n1 = ListNode(i32){ .val = 3 };
    var n2 = ListNode(i32){ .val = 2 };
    var n3 = ListNode(i32){ .val = 5 };
    var n4 = ListNode(i32){ .val = 4 };
    // Set up references between the nodes
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print(
        "Initial linked list: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // Insert a node
    var tmp = ListNode(i32){ .val = 0 };
    insert(i32, &n0, &tmp);
    std.debug.print(
        "Linked list after inserting a node: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // Remove a node
    remove(i32, &n0);
    std.debug.print(
        "Linked list after removing a node: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // Access a node
    const node = access(i32, &n0, 3);
    std.debug.print(
        "Value of the linked-list node at index 3 = {}\n",
        .{node.?.val},
    );

    // Find a node
    const index = find(i32, &n0, 2);
    std.debug.print(
        "Index of the linked-list node with value 2 = {}\n",
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
