/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
    private var front: ListNode? // 首節點
    private var rear: ListNode? // 尾節點
    private var _size: Int

    init() {
        _size = 0
    }

    /* 取得佇列長度 */
    func size() -> Int {
        _size
    }

    /* 判斷佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入隊 */
    func push(num: Int) {
        // 建立存有 num 的新節點，準備接到隊尾
        let node = ListNode(x: num)
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if front == nil {
            front = node
            rear = node
        }
        // 若佇列非空，將新節點接在尾節點之後
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* 出隊 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 移除首節點
        front = front?.next
        _size -= 1
        return num
    }

    /* 讀取隊首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("佇列為空")
        }
        return front!.val
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
    /* 範例程式 */
    static func main() {
        /* 初始化佇列 */
        let queue = LinkedListQueue()

        /* 將元素加入佇列 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("佇列 queue = \(queue.toArray())")

        /* 讀取隊首元素 */
        let peek = queue.peek()
        print("隊首元素 peek = \(peek)")

        /* 從佇列取出元素 */
        let pop = queue.pop()
        print("出隊元素 pop = \(pop)，出隊後 queue = \(queue.toArray())")

        /* 取得佇列長度 */
        let size = queue.size()
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty()
        print("佇列是否為空 = \(isEmpty)")
    }
}
