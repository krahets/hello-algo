/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストを使ったキュー */
class LinkedListQueue {
    private var front: ListNode? // 先頭ノード
    private var rear: ListNode? // 末尾ノード
    private var _size: Int

    init() {
        _size = 0
    }

    /* キューの要素数を取得する */
    func size() -> Int {
        _size
    }

    /* キューが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* エンキューする */
    func push(num: Int) {
        // 値が num のノードを末尾ノードの後ろに追加する
        let node = ListNode(x: num)
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if front == nil {
            front = node
            rear = node
        }
        // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* デキューする */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 先頭ノードを削除する
        front = front?.next
        _size -= 1
        return num
    }

    /* キューの先頭要素を参照する */
    func peek() -> Int {
        if isEmpty() {
            fatalError("キューが空です")
        }
        return front!.val
    }

    /* 連結リストを配列に変換して返す */
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
    /* 実行例 */
    static func main() {
        /* キューを初期化する */
        let queue = LinkedListQueue()

        /* 要素をキューに追加する */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("キュー queue = \(queue.toArray())")

        /* キューの先頭要素を参照する */
        let peek = queue.peek()
        print("先頭要素 peek = \(peek)")

        /* キューから要素を取り出す */
        let pop = queue.pop()
        print("デキューした要素 pop = \(pop)、デキュー後の queue = \(queue.toArray())")

        /* キューの要素数を取得する */
        let size = queue.size()
        print("キューの要素数 size = \(size)")

        /* キューが空かどうかを判定する */
        let isEmpty = queue.isEmpty()
        print("キューは空か = \(isEmpty)")
    }
}
