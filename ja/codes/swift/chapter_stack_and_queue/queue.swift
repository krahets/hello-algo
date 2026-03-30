/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* キューを初期化 */
        // Swift には組み込みのキュークラスがないため、Array をキューとして使う
        var queue: [Int] = []

        /* 要素をエンキュー */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("キュー queue = \(queue)")

        /* キュー先頭の要素にアクセス */
        let peek = queue.first!
        print("先頭要素 peek = \(peek)")

        /* 要素をデキュー */
        // Array を用いる場合、pop の計算量は O(n)
        let pool = queue.removeFirst()
        print("デキューした要素 pop = \(pool)、デキュー後の queue = \(queue)")

        /* キューの長さを取得 */
        let size = queue.count
        print("キューのサイズ size = \(size)")

        /* キューが空かどうかを判定 */
        let isEmpty = queue.isEmpty
        print("キューが空かどうか = \(isEmpty)")
    }
}
