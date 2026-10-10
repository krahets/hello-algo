/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストベースのキュー */
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

    /* キューが空かどうかを判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* エンキュー */
    func push(num: Int) {
        // 末尾ノードの後ろに num を追加
        let node = ListNode(x: num)
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if front == nil {
            front = node
            rear = node
        }
        // キューが空でなければ、そのノードを末尾ノードの後ろに追加
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
        // 先頭ノードを削除
        front = front?.next
        _size -= 1
        return num
    }

    /* キュー先頭の要素にアクセス */
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
    /* Driver Code */
    static func main() {
        /* キューを初期化 */
        let queue = LinkedListQueue()

        /* 要素をエンキュー */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("キュー queue = \(queue.toArray())")

        /* キュー先頭の要素にアクセス */
        let peek = queue.peek()
        print("先頭要素 peek = \(peek)")

        /* 要素をデキュー */
        let pop = queue.pop()
        print("取り出した要素 pop = \(pop)，取り出し後 queue = \(queue.toArray())")

        /* キューの長さを取得 */
        let size = queue.size()
        print("キューのサイズ size = \(size)")

        /* キューが空かどうかを判定 */
        let isEmpty = queue.isEmpty()
        print("キューが空かどうか = \(isEmpty)")
    }
}
