/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack {
    private var _peek: ListNode? // 將頭節點作為堆疊頂
    private var _size: Int // 堆疊的長度

    init() {
        _size = 0
    }

    /* 獲取堆疊的長度 */
    func size() -> Int {
        _size
    }

    /* 判斷堆疊是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入堆疊 */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* 出堆疊 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* 訪問堆疊頂元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return _peek!.val
    }

    /* 將 List 轉化為 Array 並返回 */
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
        /* 初始化堆疊 */
        let stack = LinkedListStack()

        /* 元素入堆疊 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("堆疊 stack = \(stack.toArray())")

        /* 訪問堆疊頂元素 */
        let peek = stack.peek()
        print("堆疊頂元素 peek = \(peek)")

        /* 元素出堆疊 */
        let pop = stack.pop()
        print("出堆疊元素 pop = \(pop)，出堆疊後 stack = \(stack.toArray())")

        /* 獲取堆疊的長度 */
        let size = stack.size()
        print("堆疊的長度 size = \(size)")

        /* 判斷是否為空 */
        let isEmpty = stack.isEmpty()
        print("堆疊是否為空 = \(isEmpty)")
    }
}
