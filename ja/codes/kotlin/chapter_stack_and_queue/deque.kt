/**
 * File: deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
fun main() {
    // [region]{init_deque}
    /* 両端キューを初期化する */
    val deque = LinkedList<Int>()
    // [endregion]{init_deque}

    // [region]{push}
    /* 要素をエンキューする */
    deque.offerLast(2) // キューの末尾に追加する
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // キューの先頭に追加する
    deque.offerFirst(1)
    // [endregion]{push}
    println("両端キュー deque = $deque")

    // [region]{peek_first}
    /* 要素にアクセスする */
    val peekFirst = deque.peekFirst() // キューの先頭要素
    // [endregion]{peek_first}
    println("キューの先頭要素 peekFirst = $peekFirst")
    // [region]{peek_last}
    val peekLast = deque.peekLast() // キューの末尾要素
    // [endregion]{peek_last}
    println("キューの末尾要素 peekLast = $peekLast")

    // [region]{pop_first}
    /* 要素をデキューする */
    val popFirst = deque.pollFirst() // キューの先頭要素をデキューする
    // [endregion]{pop_first}
    println("先頭からデキューした要素 = $popFirst、先頭からデキューした後 deque = $deque")
    // [region]{pop_last}
    val popLast = deque.pollLast() // キューの末尾要素をデキューする
    // [endregion]{pop_last}
    println("末尾からデキューした要素 = $popLast、末尾からデキューした後 deque = $deque")

    // [region]{size}
    /* 両端キューの長さを取得する */
    val size = deque.size
    // [endregion]{size}
    println("両端キューの長さ size = $size")

    // [region]{is_empty}
    /* 両端キューが空かどうかを判定する */
    val isEmpty = deque.isEmpty()
    // [endregion]{is_empty}
    println("両端キューは空か = $isEmpty")
}