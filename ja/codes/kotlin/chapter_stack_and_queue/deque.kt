/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
fun main() {
    /* 両端キューを初期化する */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("両端キュー deque = $deque")

    /* 要素にアクセスする */
    val peekFirst = deque.peekFirst()
    println("キューの先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("キューの末尾要素 peekLast = $peekLast")

    /* 要素をエンキューする */
    deque.offerLast(4)
    println("要素 4 を末尾にエンキューした後 deque = $deque")
    deque.offerFirst(1)
    println("要素 1 を先頭にエンキューした後 deque = $deque")

    /* 要素をデキューする */
    val popLast = deque.pollLast()
    println("末尾からデキューした要素 = $popLast、末尾からデキューした後 deque = $deque")
    val popFirst = deque.pollFirst()
    println("先頭からデキューした要素 = $popFirst、先頭からデキューした後 deque = $deque")

    /* 両端キューの長さを取得する */
    val size = deque.size
    println("両端キューの長さ size = $size")

    /* 両端キューが空かどうかを判定する */
    val isEmpty = deque.isEmpty()
    println("両端キューは空か = $isEmpty")
}