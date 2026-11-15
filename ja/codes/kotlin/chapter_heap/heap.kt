/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 実行用コード */
fun main() {
    // [region]{init}
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    var minHeap = PriorityQueue<Int>()
    // 最大ヒープを初期化する（ラムダ式で Comparator を変更すればよい）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\n以下のテストケースは最大ヒープを対象とする")

    // [region]{push}
    /* ヒープに要素を挿入する */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* ヒープの先頭要素を取得する */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\nヒープの先頭要素は $peek\n")

    // [region]{pop_1}
    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列を形成する
    peek = maxHeap.poll() // 5
    // [endregion]{pop_1}
    println(peek)
    // [region]{pop_2}
    peek = maxHeap.poll() // 4
    // [endregion]{pop_2}
    println(peek)
    // [region]{pop_3}
    peek = maxHeap.poll() // 3
    // [endregion]{pop_3}
    println(peek)
    // [region]{pop_4}
    peek = maxHeap.poll() // 2
    // [endregion]{pop_4}
    println(peek)
    // [region]{pop_5}
    peek = maxHeap.poll() // 1
    // [endregion]{pop_5}
    println(peek)

    // [region]{size}
    /* ヒープのサイズを取得する */
    val size = maxHeap.size
    // [endregion]{size}
    print("\nヒープの要素数は $size\n")

    // [region]{is_empty}
    /* ヒープが空か判定 */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\nヒープは空か $isEmpty\n")

    // [region]{heapify}
    /* リストを入力してヒープを構築する */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\nリストを入力して最小ヒープを構築した後")
    printHeap(minHeap)
}