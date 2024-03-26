/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于链表实现的队列 */
class LinkedListQueue {
    private var front: ListNode? // 头节点
    private var rear: ListNode? // 尾节点
    private var _size: Int

    init() {
        _size = 0
    }

    /* 获取队列的长度 */
    func size() -> Int {
        _size
    }

    /* 判断队列是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入队 */
    func push(num: Int) {
        // 在尾节点后添加 num
        let node = ListNode(x: num)
        // 如果队列为空，则令头、尾节点都指向该节点
        if front == nil {
            front = node
            rear = node
        }
        // 如果队列不为空，则将该节点添加到尾节点后
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* 出队 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 删除头节点
        front = front?.next
        _size -= 1
        return num
    }

    /* 访问队首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("队列为空")
        }
        return front!.val
    }

    /* 将链表转化为 Array 并返回 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListQueue {
    /* Driver Code */
    static func main() {
        /* 初始化队列 */
        let queue = LinkedListQueue()

        /* 元素入队 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("队列 queue = \(queue.toArray())")

        /* 访问队首元素 */
        let peek = queue.peek()
        print("队首元素 peek = \(peek)")

        /* 元素出队 */
        let pop = queue.pop()
        print("出队元素 pop = \(pop)，出队后 queue = \(queue.toArray())")

        /* 获取队列的长度 */
        let size = queue.size()
        print("队列长度 size = \(size)")

        /* 判断队列是否为空 */
        let isEmpty = queue.isEmpty()
        print("队列是否为空 = \(isEmpty)")
    }
}
