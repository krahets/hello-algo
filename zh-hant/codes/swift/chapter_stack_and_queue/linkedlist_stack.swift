/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 以鏈結串列實作堆疊 */
class LinkedListStack {
    private var _peek: ListNode? // 以首節點作為堆疊頂端
    private var _size: Int // 堆疊長度

    init() {
        _size = 0
    }

    /* 取得堆疊長度 */
    func size() -> Int {
        _size
    }

    /* 判斷堆疊是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 推入堆疊 */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* 彈出堆疊頂端的元素 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* 讀取堆疊頂端的元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return _peek!.val
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
    /* 範例程式 */
    static func main() {
        /* 初始化堆疊 */
        let stack = LinkedListStack()

        /* 將元素推入堆疊 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("堆疊 stack = \(stack.toArray())")

        /* 讀取堆疊頂端的元素 */
        let peek = stack.peek()
        print("堆疊頂端元素 peek = \(peek)")

        /* 從堆疊彈出元素 */
        let pop = stack.pop()
        print("彈出的元素 pop = \(pop)，彈出後 stack = \(stack.toArray())")

        /* 取得堆疊長度 */
        let size = stack.size()
        print("堆疊長度 size = \(size)")

        /* 判斷堆疊是否為空 */
        let isEmpty = stack.isEmpty()
        print("堆疊是否為空 = \(isEmpty)")
    }
}
