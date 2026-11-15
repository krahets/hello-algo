/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    // [region]{init_queue}
    /* 初始化佇列 */
    val queue = LinkedList<Int>()
    // [endregion]{init_queue}

    // [region]{push}
    /* 元素入列 */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    // [endregion]{push}
    println("佇列 queue = $queue")

    // [region]{peek}
    /* 訪問佇列首元素 */
    val peek = queue.peek()
    // [endregion]{peek}
    println("佇列首元素 peek = $peek")

    // [region]{pop}
    /* 元素出列 */
    val pop = queue.poll()
    // [endregion]{pop}
    println("出列元素 pop = $pop，出列後 queue = $queue")

    // [region]{size}
    /* 獲取佇列的長度 */
    val size = queue.size
    // [endregion]{size}
    println("佇列長度 size = $size")

    // [region]{is_empty}
    /* 判斷佇列是否為空 */
    val isEmpty = queue.isEmpty()
    // [endregion]{is_empty}
    println("佇列是否為空 = $isEmpty")
}