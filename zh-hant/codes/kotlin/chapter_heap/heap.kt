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
    /* 初始化堆積 */
    // 初始化小頂堆積
    var minHeap = PriorityQueue<Int>()
    // 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\n以下測試樣例為大頂堆積")

    // [region]{push}
    /* 元素入堆積 */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* 獲取堆積頂元素 */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\n堆積頂元素為 $peek\n")

    // [region]{pop_1}
    /* 堆積頂元素出堆積 */
    // 出堆積元素會形成一個從大到小的序列
    peek = maxHeap.poll() // 5
    // [endregion]{pop_1}
    println("出堆積元素為 $peek")
    // [region]{pop_2}
    peek = maxHeap.poll() // 4
    // [endregion]{pop_2}
    println("出堆積元素為 $peek")
    // [region]{pop_3}
    peek = maxHeap.poll() // 3
    // [endregion]{pop_3}
    println("出堆積元素為 $peek")
    // [region]{pop_4}
    peek = maxHeap.poll() // 2
    // [endregion]{pop_4}
    println("出堆積元素為 $peek")
    // [region]{pop_5}
    peek = maxHeap.poll() // 1
    // [endregion]{pop_5}
    println("出堆積元素為 $peek")

    // [region]{size}
    /* 獲取堆積大小 */
    val size = maxHeap.size
    // [endregion]{size}
    print("\n堆積元素數量為 $size\n")

    // [region]{is_empty}
    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\n堆積是否為空 $isEmpty\n")

    // [region]{heapify}
    /* 輸入串列並建堆積 */
    // 時間複雜度為 O(n) ，而非 O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\n輸入串列並建立小頂堆積後")
    printHeap(minHeap)
}