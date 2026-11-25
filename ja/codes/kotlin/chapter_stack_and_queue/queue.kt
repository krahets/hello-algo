/**
 * File: queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行例 */
fun main() {
    /* キューを初期化する */
    val queue = LinkedList<Int>()

    /* 要素をキューに追加する */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)
    println("キュー queue = $queue")

    /* キューの先頭要素を参照する */
    val peek = queue.peek()
    println("先頭要素 peek = $peek")

    /* キューから要素を取り出す */
    val pop = queue.poll()
    println("デキューした要素 pop = $pop、デキュー後の queue = $queue")

    /* キューの要素数を取得する */
    val size = queue.size
    println("キューの要素数 size = $size")

    /* キューが空かどうかを判定する */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")
}