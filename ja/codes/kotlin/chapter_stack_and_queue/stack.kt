/**
 * File: stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

import java.util.*

/* 実行用コード */
fun main() {
    // [region]{init_stack}
    /* スタックを初期化する */
    val stack = Stack<Int>()
    // [endregion]{init_stack}

    // [region]{push}
    /* 要素をプッシュする */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    // [endregion]{push}
    println("スタック stack = $stack")

    // [region]{peek}
    /* スタックの先頭要素にアクセスする */
    val peek = stack.peek()
    // [endregion]{peek}
    println("スタックの先頭要素 peek = $peek")

    // [region]{pop}
    /* 要素をポップする */
    val pop = stack.pop()
    // [endregion]{pop}
    println("ポップした要素 pop = $pop、ポップ後 stack = $stack")

    // [region]{size}
    /* スタックの長さを取得する */
    val size = stack.size
    // [endregion]{size}
    println("スタックの長さ size = $size")

    // [region]{is_empty}
    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    // [endregion]{is_empty}
    println("スタックは空か = $isEmpty")
}