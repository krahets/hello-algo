// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;

// 連結リストでノード n0 の後ろにノード P を挿入する
pub fn insert(comptime T: type, n0: *ListNode(T), P: *ListNode(T)) void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

// 連結リストでノード n0 の直後のノードを削除する
pub fn remove(comptime T: type, n0: *ListNode(T)) void {
    // n0 -> P -> n1 => n0 -> n1
    const P = n0.next;
    const n1 = P.?.next;
    n0.next = n1;
}

// 連結リスト内で index 番目のノードにアクセス
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

// 連結リストで値が target の最初のノードを探す
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
    // 各ノードを初期化
    var n0 = ListNode(i32){ .val = 1 };
    var n1 = ListNode(i32){ .val = 3 };
    var n2 = ListNode(i32){ .val = 2 };
    var n3 = ListNode(i32){ .val = 5 };
    var n4 = ListNode(i32){ .val = 4 };
    // ノード間の参照を構築する
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print(
        "初期化後の連結リストは {}\n",
            .{utils.fmt.linkedList(i32, &n0)},
        );

    // ノードを挿入
    var tmp = ListNode(i32){ .val = 0 };
    insert(i32, &n0, &tmp);
    std.debug.print(
        "ノード挿入後の連結リストは {}\n",
            .{utils.fmt.linkedList(i32, &n0)},
        );

    // ノードを削除
    remove(i32, &n0);
    std.debug.print(
        "ノード削除後の連結リストは{}\n",
            .{utils.fmt.linkedList(i32, &n0)},
        );

    // ノードにアクセス
    const node = access(i32, &n0, 3);
    std.debug.print(
        "連結リストのインデックス 3 にあるノードの値 = {}\n",
            .{node.?.val},
        );

    // ノードを探索
    const index = find(i32, &n0, 2);
    std.debug.print(
        "連結リスト内の値 2 のノードのインデックス = {}\n",
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
