/**
 * File: linkedlist_stack.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_stack_and_queue

import cangjie.utils.ListNode

/* 基于链表实现的栈 */
class LinkedListStack {
    private var stackPeek: ?ListNode // 将头节点作为栈顶
    private var stkSize = 0 // 栈的长度

    public init() {
        stackPeek = None
    }

    /* 获取栈的长度 */
    public prop size: Int64 {
        get() {
            stkSize
        }
    }

    /* 判断栈是否为空 */
    public func isEmpty(): Bool {
        return stkSize == 0
    }

    /* 入栈 */
    public func push(num: Int64): Unit {
        let node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* 出栈 */
    public func pop(): ?Int64 {
        let num = peek()
        stackPeek = stackPeek?.next ?? None
        stkSize--
        return num
    }

    /* 访问栈顶元素 */
    public func peek(): ?Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return stackPeek?.val
    }

    /* 将 List 转化为 Array 并返回 */
    public func toArray(): Array<Int64> {
        var node = stackPeek
        let res = Array<Int64>(stkSize, item: 0)
        for (i in (res.size - 1)..=0 : -1) {
            res[i] = node?.val ?? 0
            node = node?.next ?? None
        }
        return res
    }
}
