/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
fun main() {
    /* キューを初期化する */
    val queue = LinkedList<Int>()

    /* 要素をエンキューする */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("キュー queue = $queue")

    /* キューの先頭要素にアクセス */
    val peek = queue.peek()
    println("キューの先頭要素 peek = $peek")

    /* 要素をデキューする */
    val pop = queue.poll()
    println("デキューした要素 pop = $pop、デキュー後 queue = $queue")

    /* キューの長さを取得 */
    val size = queue.size
    println("キューの長さ size = $size")

    /* キューが空か判定 */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")
}