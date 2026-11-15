/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* 実行用コード */
    static func main() {
        // [region]{init_queue}
        /* キューを初期化する */
        // Swift には組み込みのキュークラスがないため、Array をキューとして使える
        var queue: [Int] = []
        // [endregion]{init_queue}

        // [region]{push}
        /* 要素をエンキューする */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        // [endregion]{push}
        print("キュー queue = \(queue)")

        // [region]{peek}
        /* キューの先頭要素にアクセス */
        let peek = queue.first!
        // [endregion]{peek}
        print("キューの先頭要素 peek = \(peek)")

        // [region]{pop}
        /* 要素をデキューする */
        // Array で再現する場合、pop の計算量は O(n)
        let pop = queue.removeFirst()
        // [endregion]{pop}
        print("デキューした要素 pop = \(pop)、デキュー後 queue = \(queue)")

        // [region]{size}
        /* キューの長さを取得 */
        let size = queue.count
        // [endregion]{size}
        print("キューの長さ size = \(size)")

        // [region]{is_empty}
        /* キューが空か判定 */
        let isEmpty = queue.isEmpty
        // [endregion]{is_empty}
        print("キューは空か = \(isEmpty)")
    }
}
