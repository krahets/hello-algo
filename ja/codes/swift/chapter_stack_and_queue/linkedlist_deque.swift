/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 双方向連結リストのノード */
class ListNode {
    var val: Int // ノードの値
    var next: ListNode? // 次のノードへの参照
    weak var prev: ListNode? // 前のノードへの参照

    init(val: Int) {
        self.val = val
    }
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
    private var front: ListNode? // 先頭ノード front
    private var rear: ListNode? // 末尾ノード rear
    private var _size: Int // 両端キューの要素数

    init() {
        _size = 0
    }

    /* 両端キューの要素数を取得する */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 両端キューに要素を追加する */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // リストが空なら、front と rear の両方が node を指すようにする
        if isEmpty() {
            front = node
            rear = node
        }
        // 先頭に追加する
        else if isFront {
            // node をリストの先頭に追加する
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
        }
        // 末尾に追加する
        else {
            // node をリストの末尾に追加する
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        _size += 1 // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 末尾に追加する */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* 両端キューから要素を取り出す */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        let val: Int
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // 先頭から取り出す
        else if isFront {
            val = front!.val // 先頭ノードの値を一時的に保存する
            // 先頭ノードを削除する
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // 先頭ノードを更新する
        }
        // 末尾から取り出す
        else {
            val = rear!.val // 末尾ノードの値を一時的に保存する
            // 末尾ノードを削除する
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // 末尾ノードを更新する
        }
        _size -= 1 // 両端キューの要素数を更新する
        return val
    }

    /* 先頭から取り出す */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* 末尾から取り出す */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* 両端キューの先頭要素を参照する */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return front!.val
    }

    /* 両端キューの末尾要素を参照する */
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
    /* 実行例 */
    static func main() {
        /* 両端キューを初期化する */
        let deque = LinkedListDeque()
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
