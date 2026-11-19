/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    // [region]{init_deque}
    /* 初始化雙向佇列 */
    val deque = LinkedList<Int>()
    // [endregion]{init_deque}

    // [region]{push}
    /* 元素入列 */
    deque.offerLast(2) // 新增至佇列尾
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // 新增至佇列首
    deque.offerFirst(1)
    // [endregion]{push}
    println("雙向佇列 deque = $deque")

    // [region]{peek_first}
    /* 訪問元素 */
    val peekFirst = deque.peekFirst() // 佇列首元素
    // [endregion]{peek_first}
    println("佇列首元素 peekFirst = $peekFirst")
    // [region]{peek_last}
    val peekLast = deque.peekLast() // 佇列尾元素
    // [endregion]{peek_last}
    println("佇列尾元素 peekLast = $peekLast")

    // [region]{pop_first}
    /* 元素出列 */
    val popFirst = deque.pollFirst() // 佇列首元素出列
    // [endregion]{pop_first}
    println("佇列首出列元素 = $popFirst，佇列首出列後 deque = $deque")
    // [region]{pop_last}
    val popLast = deque.pollLast() // 佇列尾元素出列
    // [endregion]{pop_last}
    println("佇列尾出列元素 = $popLast，佇列尾出列後 deque = $deque")

    // [region]{size}
    /* 獲取雙向佇列的長度 */
    val size = deque.size
    // [endregion]{size}
    println("雙向佇列長度 size = $size")

    // [region]{is_empty}
    /* 判斷雙向佇列是否為空 */
    val isEmpty = deque.isEmpty()
    // [endregion]{is_empty}
    println("雙向佇列是否為空 = $isEmpty")
}