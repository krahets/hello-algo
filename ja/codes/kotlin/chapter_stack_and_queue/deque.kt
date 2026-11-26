/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行例 */
fun main() {
    /* 両端キューを初期化する */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("両端キュー deque = $deque")

    /* 要素を参照する */
    val peekFirst = deque.peekFirst()
    println("先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("末尾要素 peekLast = $peekLast")

    /* 要素を両端キューに追加する */
    deque.offerLast(4)
    println("末尾に 4 を追加した後の deque = $deque")
    deque.offerFirst(1)
    println("先頭に 1 を追加した後の deque = $deque")

    /* 両端キューから要素を取り出す */
    val popLast = deque.pollLast()
    println("末尾から取り出した要素 = $popLast、末尾から取り出した後の deque = $deque")
    val popFirst = deque.pollFirst()
    println("先頭から取り出した要素 = $popFirst、先頭から取り出した後の deque = $deque")

    /* 両端キューの要素数を取得する */
    val size = deque.size
    println("両端キューの要素数 size = $size")

    /* 両端キューが空かどうかを判定する */
    val isEmpty = deque.isEmpty()
    println("両端キューは空か = $isEmpty")
}