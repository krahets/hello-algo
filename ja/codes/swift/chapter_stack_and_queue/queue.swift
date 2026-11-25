/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* 実行例 */
    static func main() {
        /* キューを初期化する */
        // Swift には組み込みのキュークラスがないので、Array をキューとして使える
        var queue: [Int] = []

        /* 要素をキューに追加する */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("キュー queue = \(queue)")

        /* キューの先頭要素を参照する */
        let peek = queue.first!
        print("先頭要素 peek = \(peek)")

        /* キューから要素を取り出す */
        // Array でキューの動作を再現すると、removeFirst の時間計算量は O(n) になる
        let pop = queue.removeFirst()
        print("デキューした要素 pop = \(pop)、デキュー後の queue = \(queue)")

        /* キューの要素数を取得する */
        let size = queue.count
        print("キューの要素数 size = \(size)")

        /* キューが空かどうかを判定する */
        let isEmpty = queue.isEmpty
        print("キューは空か = \(isEmpty)")
    }
}
