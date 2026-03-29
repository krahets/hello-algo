/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストベースのスタック */
class LinkedListStack {
    private var _peek: ListNode? // 先頭ノードをスタックトップとする
    private var _size: Int // スタックの長さ

    init() {
        _size = 0
    }

    /* スタックの長さを取得 */
    func size() -> Int {
        _size
    }

    /* スタックが空かどうかを判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* プッシュ */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* ポップ */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* スタックトップの要素にアクセス */
    func peek() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return _peek!.val
    }

    /* List を Array に変換して返す */
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
        /* スタックを初期化 */
        let stack = LinkedListStack()

        /* 要素をプッシュ */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("スタック stack = \(stack.toArray())")

        /* スタックトップの要素にアクセス */
        let peek = stack.peek()
        print("スタックトップ要素 peek = \(peek)")

        /* 要素をポップ */
        let pop = stack.pop()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack.toArray())")

        /* スタックの長さを取得 */
        let size = stack.size()
        print("スタックの長さ size = \(size)")

        /* 空かどうかを判定 */
        let isEmpty = stack.isEmpty()
        print("スタックが空かどうか = \(isEmpty)")
    }
}
