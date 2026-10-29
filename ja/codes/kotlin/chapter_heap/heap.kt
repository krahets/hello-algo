/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // ヒープに要素を挿入する
    print("\n要素 $_val をヒープに挿入した後\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // ヒープの先頭要素を取り出す
    print("\nヒープの先頭要素 $_val を取り出した後\n")
    printHeap(heap)
}

/* 実行用コード */
fun main() {
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    var minHeap = PriorityQueue<Int>()

    // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下のテストケースは最大ヒープを対象とする")

    /* ヒープに要素を挿入する */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* ヒープの先頭要素を取得する */
    val peek = maxHeap.peek()
    print("\nヒープの先頭要素は $peek\n")

    /* ヒープの先頭要素を取り出す */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* ヒープのサイズを取得する */
    val size = maxHeap.size
    print("\nヒープの要素数は $size\n")

    /* ヒープが空か判定 */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープは空か $isEmpty\n")

    /* リストを入力してヒープを構築する */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nリストを入力して最小ヒープを構築した後")
    printHeap(minHeap)
}