/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 將元素加入堆積
    print("\n將元素 $_val 加入堆積後\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 取出堆積頂端元素
    print("\n取出堆積頂端元素 $_val 後\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* 初始化堆積 */
    // 初始化最小堆積
    var minHeap = PriorityQueue<Int>()

    // 初始化最大堆積（用 lambda 運算式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下以最大堆積為測試案例")

    /* 將元素加入堆積 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* 取得堆積頂端元素 */
    val peek = maxHeap.peek()
    print("\n堆積頂端元素為 $peek\n")

    /* 取出堆積頂端元素 */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* 取得堆積大小 */
    val size = maxHeap.size
    print("\n堆積中的元素個數為 $size\n")

    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆積是否為空 $isEmpty\n")

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n用輸入串列建立最小堆積後")
    printHeap(minHeap)
}