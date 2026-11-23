// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;

// 연결 리스트의 노드 n0 뒤에 노드 P 삽입
pub fn insert(comptime T: type, n0: *ListNode(T), P: *ListNode(T)) void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

// 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제
pub fn remove(comptime T: type, n0: *ListNode(T)) void {
    // n0 -> P -> n1 => n0 -> n1
    const P = n0.next;
    const n1 = P.?.next;
    n0.next = n1;
}

// 연결 리스트에서 인덱스가 index인 노드에 접근
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

// 연결 리스트에서 값이 target인 첫 번째 노드 탐색
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

// 실행 코드
pub fn run() void {
    // 각 노드를 초기화한다
    var n0 = ListNode(i32){ .val = 1 };
    var n1 = ListNode(i32){ .val = 3 };
    var n2 = ListNode(i32){ .val = 2 };
    var n3 = ListNode(i32){ .val = 5 };
    var n4 = ListNode(i32){ .val = 4 };
    // 노드 사이의 참조를 설정한다
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print(
        "초기화한 연결 리스트: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 노드 삽입
    var tmp = ListNode(i32){ .val = 0 };
    insert(i32, &n0, &tmp);
    std.debug.print(
        "노드를 삽입한 후의 연결 리스트: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 노드 삭제
    remove(i32, &n0);
    std.debug.print(
        "노드를 삭제한 후의 연결 리스트: {}\n",
        .{utils.fmt.linkedList(i32, &n0)},
    );

    // 노드 접근
    const node = access(i32, &n0, 3);
    std.debug.print(
        "연결 리스트에서 인덱스 3에 있는 노드의 값 = {}\n",
        .{node.?.val},
    );

    // 노드 탐색
    const index = find(i32, &n0, 2);
    std.debug.print(
        "연결 리스트에서 값이 2인 노드의 인덱스 = {}\n",
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
