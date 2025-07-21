/**
 * File: linked_list_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_array_and_linkedlist

import std.unittest.testmacro.*
import std.unittest.*
import cangjie.utils.{PrintUtil, ListNode}

/* Driver Code */
@Test
func testLinkedListTest() {
    /* 初始化链表 */
    // 初始化各个节点
    let n0 = ListNode(1)
    let n1 = ListNode(3)
    let n2 = ListNode(2)
    let n3 = ListNode(5)
    let n4 = ListNode(4)
    // 构建节点之间的引用
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("初始化的链表为")
    PrintUtil.printLinkedList(n0)

    /* 插入节点 */
    insert(n0, ListNode(0))
    println("插入节点后的链表为")
    PrintUtil.printLinkedList(n0)

    /* 删除节点 */
    remove(n0)
    println("删除节点后的链表为")
    PrintUtil.printLinkedList(n0)

    /* 访问节点 */
    let node = access(n0, 3)
    println("链表中索引 3 处的节点的值 = ${node?.val}")

    /* 查找节点 */
    let index = find(n0, 2)
    println("链表中值为 2 的节点的索引 = ${index}")
}
