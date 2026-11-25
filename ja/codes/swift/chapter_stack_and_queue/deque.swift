/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 実行例 */
    static func main() {
        /* 両端キューを初期化する */
        // Swift には組み込みの両端キュークラスがないので、Array を両端キューとして使える
        var deque: [Int] = []

        /* 要素を両端キューに追加する */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("両端キュー deque = \(deque)")

        /* 要素を参照する */
        let peekFirst = deque.first!
        print("先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("末尾要素 peekLast = \(peekLast)")

        /* 両端キューから要素を取り出す */
        // Array で両端キューの動作を再現すると、removeFirst の時間計算量は O(n) になる
        let popFirst = deque.removeFirst()
        print("先頭から取り出した要素 popFirst = \(popFirst)、先頭から取り出した後の deque = \(deque)")
        let popLast = deque.removeLast()
        print("末尾から取り出した要素 popLast = \(popLast)、末尾から取り出した後の deque = \(deque)")

        /* 両端キューの要素数を取得する */
        let size = deque.count
        print("両端キューの要素数 size = \(size)")

        /* 両端キューが空かどうかを判定する */
        let isEmpty = deque.isEmpty
        print("両端キューは空か = \(isEmpty)")
    }
}
