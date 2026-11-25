/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列を使ったキュー */
class ArrayQueue {
    private var nums: [Int] // キューの要素を格納する配列
    private var front: Int // キューの先頭要素を指すインデックス
    private var _size: Int // キューの要素数

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
        if size() == capacity() {
            print("キューが満杯です")
            return
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        let rear = (front + size()) % capacity()
        // num をキューの末尾に追加する
        nums[rear] = num
        _size += 1
    }

    /* デキューする */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* キューの先頭要素を参照する */
    func peek() -> Int {
        if isEmpty() {
            fatalError("キューが空です")
        }
        return nums[front]
    }

    /* 配列を返す */
    func toArray() -> [Int] {
        // キューの要素数に当たる範囲だけを変換する
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* 実行例 */
    static func main() {
        /* キューを初期化する */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

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

        /* 循環配列の動作を確認する */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 回のエンキューとデキューを終えた後の queue = \(queue.toArray())")
        }
    }
}
