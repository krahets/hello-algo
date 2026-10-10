/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* Driver Code */
fun main() {
    /* 両端キューを初期化 */
    val deque = LinkedList<Int>()
    deque.offerLast(3)
    deque.offerLast(2)
    deque.offerLast(5)
    println("両端キュー deque = $deque")

    /* 要素にアクセス */
    val peekFirst = deque.peekFirst()
    println("先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("末尾要素 peekLast = $peekLast")

    /* 要素をエンキュー */
    deque.offerLast(4)
    println("要素 4 を末尾に追加後 deque = $deque")
    deque.offerFirst(1)
    println("要素 1 を先頭に追加後 deque = $deque")

    /* 要素をデキュー */
    val popLast = deque.pollLast()
    println("末尾から取り出した要素 = $popLast、取り出し後 deque = $deque")
    val popFirst = deque.pollFirst()
    println("先頭から取り出した要素 = $popFirst、取り出し後 deque = $deque")

    /* 両端キューの長さを取得 */
    val size = deque.size
    println("双方向キューの長さ size = $size")

    /* 両端キューが空かどうかを判定 */
    val isEmpty = deque.isEmpty()
    println("双方向キューが空かどうか = $isEmpty")
}