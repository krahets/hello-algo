/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列で実装した両端キュー */
class ArrayDeque {
    private var nums: [Int] // 両端キューの要素を格納する配列
    private var front: Int // キューの先頭要素を指す先頭ポインタ
    private var _size: Int // 両端キューの長さ

    /* コンストラクタ */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 両端キューの容量を取得する */
    func capacity() -> Int {
        nums.count
    }

    /* 両端キューの長さを取得する */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 循環配列のインデックスを計算する */
    private func index(i: Int) -> Int {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        (i + capacity()) % capacity()
    }

    /* 先頭にエンキューする */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("両端キューが満杯です")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        front = index(i: front - 1)
        // num をキューの先頭に追加する
        nums[front] = num
        _size += 1
    }

    /* 末尾にエンキューする */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("両端キューが満杯です")
            return
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        let rear = index(i: front + size())
        // num をキューの末尾に追加する
        nums[rear] = num
        _size += 1
    }

    /* 先頭からデキューする */
    func popFirst() -> Int {
        let num = peekFirst()
        // 先頭ポインタを後ろに 1 つ移動する
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* 末尾からデキューする */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* キューの先頭要素にアクセス */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return nums[front]
    }

    /* キューの末尾要素にアクセスする */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        // 末尾要素のインデックスを計算する
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 表示用の配列を返す */
    func toArray() -> [Int] {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* 実行用コード */
    static func main() {
        /* 両端キューを初期化する */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("両端キュー deque = \(deque.toArray())")

        /* 要素にアクセスする */
        let peekFirst = deque.peekFirst()
        print("キューの先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("キューの末尾要素 peekLast = \(peekLast)")

        /* 要素をエンキューする */
        deque.pushLast(num: 4)
        print("要素 4 を末尾にエンキューした後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("要素 1 を先頭にエンキューした後 deque = \(deque.toArray())")

        /* 要素をデキューする */
        let popLast = deque.popLast()
        print("末尾からデキューした要素 = \(popLast)、末尾からデキューした後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("先頭からデキューした要素 = \(popFirst)、先頭からデキューした後 deque = \(deque.toArray())")

        /* 両端キューの長さを取得する */
        let size = deque.size()
        print("両端キューの長さ size = \(size)")

        /* 両端キューが空かどうかを判定する */
        let isEmpty = deque.isEmpty()
        print("両端キューは空か = \(isEmpty)")
    }
}
