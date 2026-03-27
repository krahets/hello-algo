// File: linked_list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;

// Вставить узел P после узла n0 в связном списке
pub fn insert(comptime T: type, n0: *ListNode(T), P: *ListNode(T)) void {
    const n1 = n0.next;
    P.next = n1;
    n0.next = P;
}

// Удалить первый узел после узла n0 в связном списке
pub fn remove(comptime T: type, n0: *ListNode(T)) void {
    // n0 -> P -> n1 => n0 -> n1
    const P = n0.next;
    const n1 = P.?.next;
    n0.next = n1;
}

// Доступ к узлу связного списка по индексу index
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

// Найти в связном списке первый узел со значением target
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
    // Инициализация всех узлов
    var n0 = ListNode(i32){ .val = 1 };
    var n1 = ListNode(i32){ .val = 3 };
    var n2 = ListNode(i32){ .val = 2 };
    var n3 = ListNode(i32){ .val = 5 };
    var n4 = ListNode(i32){ .val = 4 };
    // Построить ссылки между узлами
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    std.debug.print(
        "Инициализированный связный список = {}\n",\n    .{utils.fmt.linkedList(i32, &n0)},\n);

    // Вставка узла
    var tmp = ListNode(i32){ .val = 0 };
    insert(i32, &n0, &tmp);
    std.debug.print(
        "Связный список после вставки узла = {}\n",\n    .{utils.fmt.linkedList(i32, &n0)},\n);

    // Удаление узла
    remove(i32, &n0);
    std.debug.print(
        "Связный список после удаления узла = {}\n",\n    .{utils.fmt.linkedList(i32, &n0)},\n);

    // Доступ к узлу
    const node = access(i32, &n0, 3);
    std.debug.print(
        "Значение узла по индексу 3 в связном списке = {}\n",\n    .{node.?.val},\n);

    // Поиск узла
    const index = find(i32, &n0, 2);
    std.debug.print(
        "Индекс узла со значением 2 в связном списке = {}\n",\n    .{index},\n);

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "linked_list" {
    run();
}
