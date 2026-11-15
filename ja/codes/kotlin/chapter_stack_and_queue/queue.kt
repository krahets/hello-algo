/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
fun main() {
    // [region]{init_queue}
    /* キューを初期化する */
    val queue = LinkedList<Int>()
    // [endregion]{init_queue}

    // [region]{push}
    /* 要素をエンキューする */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    // [endregion]{push}
    println("キュー queue = $queue")

    // [region]{peek}
    /* キューの先頭要素にアクセス */
    val peek = queue.peek()
    // [endregion]{peek}
    println("キューの先頭要素 peek = $peek")

    // [region]{pop}
    /* 要素をデキューする */
    val pop = queue.poll()
    // [endregion]{pop}
    println("デキューした要素 pop = $pop、デキュー後 queue = $queue")

    // [region]{size}
    /* キューの長さを取得 */
    val size = queue.size
    // [endregion]{size}
    println("キューの長さ size = $size")

    // [region]{is_empty}
    /* キューが空か判定 */
    val isEmpty = queue.isEmpty()
    // [endregion]{is_empty}
    println("キューは空か = $isEmpty")
}