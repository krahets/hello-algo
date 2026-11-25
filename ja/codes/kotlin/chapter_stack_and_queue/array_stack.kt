/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 配列を使ったスタック */
class ArrayStack {
    // リスト（動的配列）を初期化する
    private val stack = mutableListOf<Int>()

    /* スタックの要素数を取得する */
    fun size(): Int {
        return stack.size
    }

    /* スタックが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* プッシュする */
    fun push(num: Int) {
        stack.add(num)
    }

    /* ポップする */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* スタックのトップを参照する */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* リストを配列に変換して返す */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* 実行例 */
fun main() {
    /* スタックを初期化する */
    val stack = ArrayStack()

    /* 要素をプッシュする */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("スタック stack = ${stack.toArray().contentToString()}")

    /* スタックのトップを参照する */
    val peek = stack.peek()
    println("スタックのトップの要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()
    println("ポップした要素 pop = $pop、ポップ後の stack = ${stack.toArray().contentToString()}")

    /* スタックの要素数を取得する */
    val size = stack.size()
    println("スタックの要素数 size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}