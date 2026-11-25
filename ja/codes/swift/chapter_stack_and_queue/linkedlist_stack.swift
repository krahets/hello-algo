/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストを使ったスタック */
class LinkedListStack {
    private var _peek: ListNode? // 先頭ノードをスタックのトップとする
    private var _size: Int // スタックの要素数

    init() {
        _size = 0
    }

    /* スタックの要素数を取得する */
    func size() -> Int {
        _size
    }

    /* スタックが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* プッシュする */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* ポップする */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* スタックのトップを参照する */
    func peek() -> Int {
        if isEmpty() {
            fatalError("スタックが空です")
        }
        return _peek!.val
    }

    /* 連結リストを配列に変換して返す */
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
    /* 実行例 */
    static func main() {
        /* スタックを初期化する */
        let stack = LinkedListStack()

        /* 要素をプッシュする */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("スタック stack = \(stack.toArray())")

        /* スタックのトップを参照する */
        let peek = stack.peek()
        print("スタックのトップの要素 peek = \(peek)")

        /* 要素をポップする */
        let pop = stack.pop()
        print("ポップした要素 pop = \(pop)、ポップ後の stack = \(stack.toArray())")

        /* スタックの要素数を取得する */
        let size = stack.size()
        print("スタックの要素数 size = \(size)")

        /* 空かどうかを判定する */
        let isEmpty = stack.isEmpty()
        print("スタックは空か = \(isEmpty)")
    }
}
