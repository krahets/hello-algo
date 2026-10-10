/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 循環配列ベースの両端キュー */
class ArrayDeque {
    private var nums: [Int] // 両端キューの要素を格納する配列
    private var front: Int // 先頭ポインタ。先頭要素を指す
    private var _size: Int // 両端キューの長さ

    /* コンストラクタ */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 両端キューの容量を取得 */
    func capacity() -> Int {
        nums.count
    }

    /* 両端キューの長さを取得 */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 循環配列のインデックスを計算 */
    private func index(i: Int) -> Int {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        (i + capacity()) % capacity()
    }

    /* キュー先頭にエンキュー */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("両端キューがいっぱいです")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        front = index(i: front - 1)
        // num をキュー先頭に追加
        nums[front] = num
        _size += 1
    }

    /* キュー末尾にエンキュー */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("両端キューがいっぱいです")
            return
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        let rear = index(i: front + size())
        // num をキュー末尾に追加
        nums[rear] = num
        _size += 1
    }

    /* キュー先頭からデキュー */
    func popFirst() -> Int {
        let num = peekFirst()
        // 先頭ポインタを 1 つ後ろへ進める
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* キュー末尾からデキュー */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* キュー先頭の要素にアクセス */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return nums[front]
    }

    /* キュー末尾の要素にアクセス */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        // 末尾要素のインデックスを計算
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 出力用の配列を返す */
    func toArray() -> [Int] {
        // 有効長の範囲内のリスト要素のみを変換
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* 両端キューを初期化 */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("両端キュー deque = \(deque.toArray())")

        /* 要素にアクセス */
        let peekFirst = deque.peekFirst()
        print("先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("末尾要素 peekLast = \(peekLast)")

        /* 要素をエンキュー */
        deque.pushLast(num: 4)
        print("要素 4 を末尾に追加した後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("要素 1 を先頭に追加した後 deque = \(deque.toArray())")

        /* 要素をデキュー */
        let popLast = deque.popLast()
        print("末尾から取り出した要素 = \(popLast)，末尾から取り出した後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("先頭から取り出した要素 = \(popFirst)，先頭から取り出した後 deque = \(deque.toArray())")

        /* 両端キューの長さを取得 */
        let size = deque.size()
        print("両端キューのサイズ size = \(size)")

        /* 両端キューが空かどうかを判定 */
        let isEmpty = deque.isEmpty()
        print("両端キューが空かどうか = \(isEmpty)")
    }
}
