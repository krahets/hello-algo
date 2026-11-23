/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 双方向連結リストのノード */
class ListNode {
    var val: Int // ノードの値
    var next: ListNode? // 後続ノードへの参照
    weak var prev: ListNode? // 前のノードへの参照

    init(val: Int) {
        self.val = val
    }
}

/* 双方向連結リストで実装した両端キュー */
class LinkedListDeque {
    private var front: ListNode? // 先頭ノード front
    private var rear: ListNode? // 末尾ノード rear
    private var _size: Int // 両端キューの長さ

    init() {
        _size = 0
    }

    /* 両端キューの長さを取得する */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* エンキュー操作 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if isEmpty() {
            front = node
            rear = node
        }
        // 先頭へのエンキュー操作
        else if isFront {
            // node を連結リストの先頭に追加する
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加する
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        _size += 1 // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 末尾にエンキューする */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* デキュー操作 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        let val: Int
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // 先頭からのデキュー操作
        else if isFront {
            val = front!.val // 先頭ノードの値を一時保存する
            // 先頭ノードを削除する
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // 先頭ノードを更新する
        }
        // 末尾からのデキュー操作
        else {
            val = rear!.val // 末尾ノードの値を一時保存する
            // 末尾ノードを削除する
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // 末尾ノードを更新する
        }
        _size -= 1 // キューの長さを更新する
        return val
    }

    /* 先頭からデキューする */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* 末尾からデキューする */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* キューの先頭要素にアクセス */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return front!.val
    }

    /* キューの末尾要素にアクセスする */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return rear!.val
    }

    /* 表示用の配列を返す */
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
enum _LinkedListDeque {
    /* 実行用コード */
    static func main() {
        /* 両端キューを初期化する */
        let deque = LinkedListDeque()
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
