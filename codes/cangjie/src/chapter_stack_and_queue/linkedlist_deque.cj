/**
 * File: linkedlist_deque.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_stack_and_queue

/* 双向链表节点 */
class ListNode {
    var val: Int64 // 节点值
    var next: ?ListNode // 后继节点引用
    var prev: ?ListNode // 前驱节点引用

    public init(val: Int64) {
        this.val = val
        this.next = None
        this.prev = None
    }
}

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
    private var front: ?ListNode // 头节点 front
    private var rear: ?ListNode // 尾节点 rear
    private var queSize = 0 // 双向队列的长度

    public init() {
        front = None
        rear = None
    }

    /* 获取双向队列的长度 */
    public prop size: Int64 {
        get() {
            queSize
        }
    }

    /* 判断双向队列是否为空 */
    public func isEmpty(): Bool {
        return size == 0
    }

    /* 入队操作 */
    private func push(num: Int64, isFront: Bool): Unit {
        let node = ListNode(num)
        // 若链表为空，则令 front 和 rear 都指向 node
        if (isEmpty()) {
            front = node
            rear = node
        } else if (isFront) { // 队首入队操作
            // 将 node 添加至链表头部
            front?.prev = node
            node.next = front
            front = node // 更新头节点
        } else { // 队尾入队操作
            // 将 node 添加至链表尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾节点
        }
        queSize++ // 更新队列长度
    }

    /* 队首入队 */
    public func pushFirst(num: Int64): Unit {
        push(num, true)
    }

    /* 队尾入队 */
    public func pushLast(num: Int64): Unit {
        push(num, false)
    }

    /* 出队操作 */
    private func pop(isFront: Bool): Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        let val: Int64
        // 队首出队操作
        if (isFront) {
            val = front?.val ?? 0 // 暂存头节点值

            // 删除头节点
            let fNext = front?.next ?? None
            if (fNext.isSome()) {
                fNext?.prev = None
                front?.next = None
            }
            front = fNext // 更新头节点
        // 队尾出队操作
        } else {
            val = rear?.val ?? 0 // 暂存尾节点值

            // 删除尾节点
            var rPrev = rear?.prev ?? None
            if (rPrev.isSome()) {
                rPrev?.next = None
                rear?.prev = None
            }
            rear = rPrev // 更新尾节点
        }
        queSize-- // 更新队列长度
        return val
    }

    /* 队首出队 */
    public func popFirst(): Int64 {
        return pop(true)
    }

    /* 队尾出队 */
    public func popLast(): Int64 {
        return pop(false)
    }

    /* 访问队首元素 */
    public func peekFirst(): ?Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return front?.val
    }

    /* 访问队尾元素 */
    public func peekLast(): ?Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return rear?.val
    }

    /* 返回数组用于打印 */
    public func toArray(): Array<Int64> {
        var node = front
        let res = Array<Int64>(size, {i => 0})
        for (i in 0..size) {
            res[i] = node?.val ?? 0
            node = node?.next ?? None
        }
        return res
    }
}
