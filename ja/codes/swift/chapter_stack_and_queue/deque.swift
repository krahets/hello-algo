/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 実行用コード */
    static func main() {
        // [region]{init_deque}
        /* 両端キューを初期化する */
        // Swift には組み込みの両端キュークラスがないため、Array を両端キューとして使える
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* 要素をエンキューする */
        deque.append(2) // キューの末尾に追加する
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // キューの先頭に追加する
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("両端キュー deque = \(deque)")

        // [region]{peek_first}
        /* 要素にアクセスする */
        let peekFirst = deque.first! // キューの先頭要素
        // [endregion]{peek_first}
        print("キューの先頭要素 peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // キューの末尾要素
        // [endregion]{peek_last}
        print("キューの末尾要素 peekLast = \(peekLast)")

        // [region]{pop_first}
        /* 要素をデキューする */
        // Array で再現する場合、popFirst の計算量は O(n)
        let popFirst = deque.removeFirst() // キューの先頭要素をデキューする
        // [endregion]{pop_first}
        print("先頭からデキューした要素 popFirst = \(popFirst)、先頭からデキューした後 deque = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // キューの末尾要素をデキューする
        // [endregion]{pop_last}
        print("末尾からデキューした要素 popLast = \(popLast)、末尾からデキューした後 deque = \(deque)")

        // [region]{size}
        /* 両端キューの長さを取得する */
        let size = deque.count
        // [endregion]{size}
        print("両端キューの長さ size = \(size)")

        // [region]{is_empty}
        /* 両端キューが空かどうかを判定する */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("両端キューは空か = \(isEmpty)")
    }
}
