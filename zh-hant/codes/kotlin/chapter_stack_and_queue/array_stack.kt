/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 基於陣列實現的堆疊 */
class ArrayStack {
    // 初始化串列（動態陣列）
    private val stack = mutableListOf<Int>()

    /* 獲取堆疊的長度 */
    fun size(): Int {
        return stack.size
    }

    /* 判斷堆疊是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 入堆疊 */
    fun push(num: Int) {
        stack.add(num)
    }

    /* 出堆疊 */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* 訪問堆疊頂元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* 將 List 轉化為 Array 並返回 */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* Driver Code */
fun main() {
    /* 初始化堆疊 */
    val stack = ArrayStack()

    /* 元素入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = ${stack.toArray().contentToString()}")

    /* 訪問堆疊頂元素 */
    val peek = stack.peek()
    println("堆疊頂元素 peek = $peek")

    /* 元素出堆疊 */
    val pop = stack.pop()
    println("出堆疊元素 pop = $pop，出堆疊後 stack = ${stack.toArray().contentToString()}")

    /* 獲取堆疊的長度 */
    val size = stack.size()
    println("堆疊的長度 size = $size")

    /* 判斷是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}