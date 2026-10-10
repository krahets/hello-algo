/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n要素 \(val) をヒープに追加した後\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nヒープ先頭要素 \(val) を取り出した後\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* ヒープを初期化 */
        // Swift の Heap 型は最大ヒープと最小ヒープの両方をサポートする
        var heap = Heap<Int>()

        /* 要素をヒープに追加 */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* ヒープ頂点の要素を取得 */
        let peek = heap.max()
        print("\nヒープ先頭要素は \(peek!)\n")

        /* ヒープ頂点の要素を取り出す */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* ヒープのサイズを取得 */
        let size = heap.count
        print("\nヒープ内の要素数は \(size)\n")

        /* ヒープが空かどうかを判定 */
        let isEmpty = heap.isEmpty
        print("\nヒープが空かどうか \(isEmpty)\n")

        /* リストを入力してヒープを構築 */
        // 時間計算量は O(n) であり、O(nlogn) ではない
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nリストを入力してヒープを構築した後")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
