/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 双方向連結リストノード */
class ListNode {
    var val: Int // ノード値
    var next: ListNode? // 後続ノードへの参照
    weak var prev: ListNode? // 前駆ノードへの参照

    init(val: Int) {
        self.val = val
    }
}

/* 双方向連結リストベースの両端キュー */
class LinkedListDeque {
    private var front: ListNode? // 先頭ノード front
    private var rear: ListNode? // 末尾ノード rear
    private var _size: Int // 両端キューの長さ

    init() {
        _size = 0
    }

    /* 両端キューの長さを取得 */
    func size() -> Int {
        _size
    }

    /* 両端キューが空かどうかを判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* エンキュー操作 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 連結リストが空なら、front と rear の両方を node に向ける
        if isEmpty() {
            front = node
            rear = node
        }
        // 先頭へのエンキュー操作
        else if isFront {
            // node を連結リストの先頭に追加
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        _size += 1 // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* キュー末尾にエンキュー */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* デキュー操作 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        let val: Int
        // キュー先頭からの取り出し
        if isFront {
            val = front!.val // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // 先頭ノードを更新する
        }
        // キュー末尾からの取り出し
        else {
            val = rear!.val // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // 末尾ノードを更新する
        }
        _size -= 1 // キューの長さを更新
        return val
    }

    /* キュー先頭からデキュー */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* キュー末尾からデキュー */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* キュー先頭の要素にアクセス */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return front!.val
    }

    /* キュー末尾の要素にアクセス */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("両端キューが空です")
        }
        return rear!.val
    }

    /* 出力用の配列を返す */
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
    /* Driver Code */
    static func main() {
        /* 両端キューを初期化 */
        let deque = LinkedListDeque()
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
