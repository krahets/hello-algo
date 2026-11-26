/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 要素をヒープに挿入する
    print("\n要素 $_val の挿入後：\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 根の要素を取り出す
    print("\n根の要素 $_val を取り出した後：\n")
    printHeap(heap)
}

/* 実行例 */
fun main() {
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    var minHeap = PriorityQueue<Int>()

    // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下は最大ヒープのテスト例")

    /* 要素をヒープに挿入する */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* ヒープの根の要素を取得する */
    val peek = maxHeap.peek()
    print("\nヒープの根の要素：$peek\n")

    /* 根の要素を取り出す */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* ヒープのサイズを取得する */
    val size = maxHeap.size
    print("\nヒープの要素数：$size\n")

    /* ヒープが空か判定する */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープは空か：$isEmpty\n")

    /* 入力リストからヒープを構築する */
    // 時間計算量は O(nlogn) ではなく O(n)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n入力リストから構築した最小ヒープ：")
    printHeap(minHeap)
}