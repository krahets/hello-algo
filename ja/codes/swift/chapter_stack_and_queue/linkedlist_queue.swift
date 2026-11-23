/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストで実装したキュー */
class LinkedListQueue {
    private var front: ListNode? // 先頭ノード
    private var rear: ListNode? // 末尾ノード
    private var _size: Int

    init() {
        _size = 0
    }

    /* キューの長さを取得 */
    func size() -> Int {
        _size
    }

    /* キューが空か判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* エンキュー */
    func push(num: Int) {
        // 末尾ノードの後ろに num を追加する
        let node = ListNode(x: num)
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if front == nil {
            front = node
            rear = node
        }
        // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* デキュー */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 先頭ノードを削除する
        front = front?.next
        _size -= 1
        return num
    }

    /* キューの先頭要素にアクセス */
    func peek() -> Int {
        if isEmpty() {
            fatalError("キューが空です")
        }
        return front!.val
    }

    /* 連結リストを Array に変換して返す */
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
    /* 実行用コード */
    static func main() {
        /* キューを初期化する */
        let queue = LinkedListQueue()

        /* 要素をエンキューする */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("キュー queue = \(queue.toArray())")

        /* キューの先頭要素にアクセス */
        let peek = queue.peek()
        print("キューの先頭要素 peek = \(peek)")

        /* 要素をデキューする */
        let pop = queue.pop()
        print("デキューした要素 pop = \(pop)、デキュー後 queue = \(queue.toArray())")

        /* キューの長さを取得 */
        let size = queue.size()
        print("キューの長さ size = \(size)")

        /* キューが空か判定 */
        let isEmpty = queue.isEmpty()
        print("キューは空か = \(isEmpty)")
    }
}
