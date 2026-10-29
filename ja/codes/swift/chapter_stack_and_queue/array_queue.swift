/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列で実装したキュー */
class ArrayQueue {
    private var nums: [Int] // キューの要素を格納する配列
    private var front: Int // キューの先頭要素を指す先頭ポインタ
    private var _size: Int // キューの長さ

    init(capacity: Int) {
        // 配列を初期化する
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* キューの容量を取得する */
    func capacity() -> Int {
        nums.count
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
        if size() == capacity() {
            print("キューが満杯です")
            return
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        let rear = (front + size()) % capacity()
        // num をキューの末尾に追加する
        nums[rear] = num
        _size += 1
    }

    /* デキュー */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* キューの先頭要素にアクセス */
    func peek() -> Int {
        if isEmpty() {
            fatalError("キューが空です")
        }
        return nums[front]
    }

    /* 配列を返す */
    func toArray() -> [Int] {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* 実行用コード */
    static func main() {
        /* キューを初期化する */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

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

        /* 循環配列をテストする */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 回のエンキューとデキューの後 queue = \(queue.toArray())")
        }
    }
}
