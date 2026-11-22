/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // 元素入堆
    print("\n元素 $_val 入堆后\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // 堆顶元素出堆
    print("\n堆顶元素 $_val 出堆后\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* 初始化堆 */
    // 初始化小顶堆
    var minHeap = PriorityQueue<Int>()

    // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\n以下测试样例为大顶堆")

    /* 元素入堆 */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* 获取堆顶元素 */
    val peek = maxHeap.peek()
    print("\n堆顶元素为 $peek\n")

    /* 堆顶元素出堆 */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* 获取堆大小 */
    val size = maxHeap.size
    print("\n堆元素数量为 $size\n")

    /* 判断堆是否为空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆是否为空 $isEmpty\n")

    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\n输入列表并建立小顶堆后")
    printHeap(minHeap)
}