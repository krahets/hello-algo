/**
 * File: linkedlist_queue.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_stack_and_queue

import cangjie.utils.ListNode

/* 基于链表实现的队列 */
class LinkedListQueue {
    private var front: ?ListNode // 头节点 front 
    private var rear: ?ListNode // 尾节点 rear
    private var queSize = 0

    public init() {
        front = None
        rear = None
    }

    /* 获取队列的长度 */
    public prop size: Int64 {
        get() {
            queSize
        }
    }

    /* 判断队列是否为空 */
    public func isEmpty(): Bool {
        return queSize == 0
    }

    /* 入队 */
    public func push(num: Int64): Unit {
        // 在尾节点后添加 num
        let node: ListNode = ListNode(num)
        // 如果队列为空，则令头、尾节点都指向该节点
        if (front.isNone()) {
            front = node
            rear = node
        // 如果队列不为空，则将该节点添加到尾节点后
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }
    /* 出队 */

    public func pop(): ?Int64 {
        let num = peek()
        // 删除头节点
        front = front?.next ?? None
        queSize--
        return num
    }

    /* 访问队首元素 */
    public func peek(): ?Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return front?.val
    }

    /* 将链表转化为 Array 并返回 */
    public func toArray(): Array<Int64> {
        var node: ?ListNode = front
        let res = Array<Int64>(queSize, item: 0)
        for (i in 0..res.size) {
            res[i] = node?.val ?? 0
            node = node?.next ?? None
        }
        return res
    }
}
