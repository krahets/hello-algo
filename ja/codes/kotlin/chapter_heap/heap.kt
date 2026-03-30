/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 要素をヒープに追加
    print("\n要素 $_val をヒープに追加した後\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // ヒープ頂点の要素を取り出す
    print("\nヒープ先頭要素 $_val を取り出した後\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    var minHeap = PriorityQueue<Int>()

    // 最大ヒープを初期化する（lambda 式で Comparator を変更すればよい）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下のテストケースは最大ヒープです")

    /* 要素をヒープに追加 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* ヒープ頂点の要素を取得 */
    val peek = maxHeap.peek()
    print("\nヒープ先頭要素は $peek\n")

    /* ヒープ頂点の要素を取り出す */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* ヒープのサイズを取得 */
    val size = maxHeap.size
    print("\nヒープ要素数は $size\n")

    /* ヒープが空かどうかを判定 */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープが空かどうか $isEmpty\n")

    /* リストを入力してヒープを構築 */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n入力リストから最小ヒープを構築した後")
    printHeap(minHeap)
}