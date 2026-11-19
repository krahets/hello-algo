/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

// [region]{import}
import HeapModule
// [endregion]{import}
import utils

@main
enum _Heap {
    /* 実行用コード */
    static func main() {
        // [region]{init}
        /* ヒープを初期化する */
        // Swift の Heap 型は最大ヒープと最小ヒープの両方に対応し、swift-collections パッケージを導入する必要がある
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* ヒープに要素を挿入する */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* ヒープの先頭要素を取得する */
        var peek = heap.max()
        // [endregion]{peek}
        print("\nヒープの先頭要素は \(peek!)\n")

        // [region]{pop_1}
        /* ヒープの先頭要素を取り出す */
        peek = heap.removeMax() // 5
        // [endregion]{pop_1}
        print("ヒープから取り出した要素は \(peek!)")
        // [region]{pop_2}
        peek = heap.removeMax() // 4
        // [endregion]{pop_2}
        print("ヒープから取り出した要素は \(peek!)")
        // [region]{pop_3}
        peek = heap.removeMax() // 3
        // [endregion]{pop_3}
        print("ヒープから取り出した要素は \(peek!)")
        // [region]{pop_4}
        peek = heap.removeMax() // 2
        // [endregion]{pop_4}
        print("ヒープから取り出した要素は \(peek!)")
        // [region]{pop_5}
        peek = heap.removeMax() // 1
        // [endregion]{pop_5}
        print("ヒープから取り出した要素は \(peek!)")

        // [region]{size}
        /* ヒープのサイズを取得する */
        let size = heap.count
        // [endregion]{size}
        print("\nヒープの要素数は \(size)\n")

        // [region]{is_empty}
        /* ヒープが空か判定 */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\nヒープは空か \(isEmpty)\n")

        // [region]{heapify}
        /* リストを入力してヒープを構築する */
        // 時間計算量は O(n) であり、O(nlogn) ではない
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\nリストを入力してヒープを構築した後")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
