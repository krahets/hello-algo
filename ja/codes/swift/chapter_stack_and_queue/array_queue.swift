/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列ベースのキュー */
class ArrayQueue {
    private var nums: [Int] // キュー要素を格納する配列
    private var front: Int // 先頭ポインタ。先頭要素を指す
    private var _size: Int // キューの長さ

    init(capacity: Int) {
        // 配列を初期化
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* キューの容量を取得 */
    func capacity() -> Int {
        nums.count
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
        if size() == capacity() {
            print("キューがいっぱいです")
            return
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        let rear = (front + size()) % capacity()
        // num をキュー末尾に追加
        nums[rear] = num
        _size += 1
    }

    /* デキュー */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* キュー先頭の要素にアクセス */
    func peek() -> Int {
        if isEmpty() {
            fatalError("キューが空です")
        }
        return nums[front]
    }

    /* 配列を返す */
    func toArray() -> [Int] {
        // 有効長の範囲内のリスト要素のみを変換
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* キューを初期化 */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

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

        /* 循環配列をテストする */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 回のエンキュー + デキュー後 queue = \(queue.toArray())")
        }
    }
}
