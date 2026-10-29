/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 実行用コード */
    static func main() {
        /* 両端キューを初期化する */
        // Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使える
        var deque: [Int] = []

        /* 要素をエンキューする */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("両端キュー deque = \(deque)")

        /* 要素にアクセスする */
        let peekFirst = deque.first!
        print("キューの先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("キューの末尾要素 peekLast = \(peekLast)")

        /* 要素をデキューする */
        // Array で再現する場合、popFirst の計算量は O(n)
        let popFirst = deque.removeFirst()
        print("先頭からデキューした要素 popFirst = \(popFirst)、先頭からデキューした後 deque = \(deque)")
        let popLast = deque.removeLast()
        print("末尾からデキューした要素 popLast = \(popLast)、末尾からデキューした後 deque = \(deque)")

        /* 両端キューの長さを取得する */
        let size = deque.count
        print("両端キューの長さ size = \(size)")

        /* 両端キューが空かどうかを判定する */
        let isEmpty = deque.isEmpty
        print("両端キューは空か = \(isEmpty)")
    }
}
