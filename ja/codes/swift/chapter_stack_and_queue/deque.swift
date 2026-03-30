/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* 両端キューを初期化 */
        // Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使う
        var deque: [Int] = []

        /* 要素をエンキュー */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("両端キュー deque = \(deque)")

        /* 要素にアクセス */
        let peekFirst = deque.first!
        print("先頭要素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("末尾要素 peekLast = \(peekLast)")

        /* 要素をデキュー */
        // Array を用いる場合、popFirst の計算量は O(n)
        let popFirst = deque.removeFirst()
        print("先頭からデキューした要素 popFirst = \(popFirst)、先頭からデキュー後の deque = \(deque)")
        let popLast = deque.removeLast()
        print("末尾からデキューした要素 popLast = \(popLast)、末尾からデキュー後の deque = \(deque)")

        /* 両端キューの長さを取得 */
        let size = deque.count
        print("両端キューのサイズ size = \(size)")

        /* 両端キューが空かどうかを判定 */
        let isEmpty = deque.isEmpty
        print("両端キューが空かどうか = \(isEmpty)")
    }
}
