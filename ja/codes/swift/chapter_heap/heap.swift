/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n要素 \(val) の挿入後：\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\n根の要素 \(val) を取り出した後：\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* 実行例 */
    static func main() {
        /* ヒープを初期化する */
        // Swift の Heap 型は最大ヒープと最小ヒープの両方に対応する
        var heap = Heap<Int>()

        /* 要素をヒープに挿入する */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* ヒープの根の要素を取得する */
        let peek = heap.max()
        print("\nヒープの根の要素：\(peek!)\n")

        /* 根の要素を取り出す */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* ヒープのサイズを取得する */
        let size = heap.count
        print("\nヒープの要素数：\(size)\n")

        /* ヒープが空か判定する */
        let isEmpty = heap.isEmpty
        print("\nヒープは空か：\(isEmpty)\n")

        /* 入力リストからヒープを構築する */
        // 時間計算量は O(nlogn) ではなく O(n)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\n入力リストから構築したヒープ：")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
