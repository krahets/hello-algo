/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 元素入堆積
    print("\n元素 $_val 入堆積後\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 堆積頂元素出堆積
    print("\n堆積頂元素 $_val 出堆積後\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* 初始化堆積 */
    // 初始化小頂堆積
    var minHeap = PriorityQueue<Int>()

    // 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下測試樣例為大頂堆積")

    /* 元素入堆積 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* 獲取堆積頂元素 */
    val peek = maxHeap.peek()
    print("\n堆積頂元素為 $peek\n")

    /* 堆積頂元素出堆積 */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* 獲取堆積大小 */
    val size = maxHeap.size
    print("\n堆積元素數量為 $size\n")

    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆積是否為空 $isEmpty\n")

    /* 輸入串列並建堆積 */
    // 時間複雜度為 O(n) ，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n輸入串列並建立小頂堆積後")
    printHeap(minHeap)
}