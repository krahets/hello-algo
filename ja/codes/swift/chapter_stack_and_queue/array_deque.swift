/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列を使った両端キュー */
class ArrayDeque {
    private var nums: [Int] // 両端キューの要素を格納する配列
    private var front: Int // 両端キューの先頭要素を指すインデックス
    private var _size: Int // 両端キューの要素数

    /* イニシャライザ */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 両端キューの容量を取得する */
    func capacity() -> Int {
        nums.count
    }

    /* 両端キューの要素数を取得する */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 循環配列のインデックスを求める */
    private func index(i: Int) -> Int {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        (i + capacity()) % capacity()
    }

    /* 先頭に追加する */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("両端キューが満杯です")
            return
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        front = index(i: front - 1)
        // num を両端キューの先頭に追加する
        nums[front] = num
        _size += 1
    }

    /* 末尾に追加する */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("両端キューが満杯です")
            return
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        let rear = index(i: front + size())
        // num を両端キューの末尾に追加する
        nums[rear] = num
        _size += 1
    }

    /* 先頭から取り出す */
    func popFirst() -> Int {
        let num = peekFirst()
        // 先頭のインデックスを 1 つ進める
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* 末尾から取り出す */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* 両端キューの先頭要素を参照する */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return nums[front]
    }

    /* 両端キューの末尾要素を参照する */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        // 末尾要素のインデックスを求める
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 表示用の配列を返す */
    func toArray() -> [Int] {
        // 両端キューの要素数に当たる範囲だけを変換する
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* 実行例 */
    static func main() {
        /* 両端キューを初期化する */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("両端キュー deque = \(deque.toArray())")

        /* 要素を参照する */
        let peekFirst = deque.peekFirst()
        print("先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("末尾要素 peekLast = \(peekLast)")

        /* 要素を両端キューに追加する */
        deque.pushLast(num: 4)
        print("末尾に 4 を追加した後の deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("先頭に 1 を追加した後の deque = \(deque.toArray())")

        /* 両端キューから要素を取り出す */
        let popLast = deque.popLast()
        print("末尾から取り出した要素 = \(popLast)、末尾から取り出した後の deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("先頭から取り出した要素 = \(popFirst)、先頭から取り出した後の deque = \(deque.toArray())")

        /* 両端キューの要素数を取得する */
        let size = deque.size()
        print("両端キューの要素数 size = \(size)")

        /* 両端キューが空かどうかを判定する */
        let isEmpty = deque.isEmpty()
        print("両端キューは空か = \(isEmpty)")
    }
}
