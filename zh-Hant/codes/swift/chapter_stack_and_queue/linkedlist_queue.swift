/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
    private var front: ListNode? // 頭節點
    private var rear: ListNode? // 尾節點
    private var _size: Int

    init() {
        _size = 0
    }

    /* 獲取佇列的長度 */
    func size() -> Int {
        _size
    }

    /* 判斷佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入列 */
    func push(num: Int) {
        // 在尾節點後新增 num
        let node = ListNode(x: num)
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if front == nil {
            front = node
            rear = node
        }
        // 如果佇列不為空，則將該節點新增到尾節點後
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* 出列 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 刪除頭節點
        front = front?.next
        _size -= 1
        return num
    }

    /* 訪問佇列首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("佇列為空")
        }
        return front!.val
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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
        /* 初始化佇列 */
        let queue = LinkedListQueue()

        /* 元素入列 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("佇列 queue = \(queue.toArray())")

        /* 訪問佇列首元素 */
        let peek = queue.peek()
        print("佇列首元素 peek = \(peek)")

        /* 元素出列 */
        let pop = queue.pop()
        print("出列元素 pop = \(pop)，出列後 queue = \(queue.toArray())")

        /* 獲取佇列的長度 */
        let size = queue.size()
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty()
        print("佇列是否為空 = \(isEmpty)")
    }
}
