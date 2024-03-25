/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于链表实现的栈 */
class LinkedListStack {
    private var _peek: ListNode? // 将头节点作为栈顶
    private var _size: Int // 栈的长度

    init() {
        _size = 0
    }

    /* 获取栈的长度 */
    func size() -> Int {
        _size
    }

    /* 判断栈是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入栈 */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* 出栈 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* 访问栈顶元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("栈为空")
        }
        return _peek!.val
    }

    /* 将 List 转化为 Array 并返回 */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: size())
        for i in res.indices.reversed() {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListStack {
    /* Driver Code */
    static func main() {
        /* 初始化栈 */
        let stack = LinkedListStack()

        /* 元素入栈 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("栈 stack = \(stack.toArray())")

        /* 访问栈顶元素 */
        let peek = stack.peek()
        print("栈顶元素 peek = \(peek)")

        /* 元素出栈 */
        let pop = stack.pop()
        print("出栈元素 pop = \(pop)，出栈后 stack = \(stack.toArray())")

        /* 获取栈的长度 */
        let size = stack.size()
        print("栈的长度 size = \(size)")

        /* 判断是否为空 */
        let isEmpty = stack.isEmpty()
        print("栈是否为空 = \(isEmpty)")
    }
}
