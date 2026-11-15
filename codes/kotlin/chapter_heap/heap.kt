/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Driver Code */
fun main() {
    // [region]{init}
    /* 初始化堆 */
    // 初始化小顶堆
    var minHeap = PriorityQueue<Int>()
    // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\n以下测试样例为大顶堆")

    // [region]{push}
    /* 元素入堆 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* 获取堆顶元素 */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\n堆顶元素为 $peek\n")

    // [region]{pop_1}
    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
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
    /* 获取堆大小 */
    val size = maxHeap.size
    // [endregion]{size}
    print("\n堆元素数量为 $size\n")

    // [region]{is_empty}
    /* 判断堆是否为空 */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\n堆是否为空 $isEmpty\n")

    // [region]{heapify}
    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\n输入列表并建立小顶堆后")
    printHeap(minHeap)
}