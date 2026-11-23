/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 配列で実装したスタック */
class ArrayStack {
    // リスト（動的配列）を初期化する
    private val stack = mutableListOf<Int>()

    /* スタックの長さを取得する */
    fun size(): Int {
        return stack.size
    }

    /* スタックが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* プッシュ */
    fun push(num: Int) {
        stack.add(num)
    }

    /* ポップ */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* スタックの先頭要素にアクセスする */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* List を Array に変換して返す */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    val peek = stack.peek()
    println("スタックの先頭要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()
    println("ポップした要素 pop = $pop、ポップ後 stack = ${stack.toArray().contentToString()}")

    /* スタックの長さを取得する */
    val size = stack.size()
    println("スタックの長さ size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}