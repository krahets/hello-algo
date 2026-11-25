/**
 * File: array_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 以陣列實作堆疊 */
class ArrayStack {
    // 初始化串列（動態陣列）
    private val stack = mutableListOf<Int>()

    /* 取得堆疊長度 */
    fun size(): Int {
        return stack.size
    }

    /* 判斷堆疊是否為空 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 推入堆疊 */
    fun push(num: Int) {
        stack.add(num)
    }

    /* 彈出堆疊頂端的元素 */
    fun pop(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack.removeAt(size() - 1)
    }

    /* 讀取堆疊頂端的元素 */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stack[size() - 1]
    }

    /* 將串列轉成陣列並回傳 */
    fun toArray(): Array<Any> {
        return stack.toTypedArray()
    }
}

/* 範例程式 */
fun main() {
    /* 初始化堆疊 */
    val stack = ArrayStack()

    /* 將元素推入堆疊 */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("堆疊 stack = ${stack.toArray().contentToString()}")

    /* 讀取堆疊頂端的元素 */
    val peek = stack.peek()
    println("堆疊頂端元素 peek = $peek")

    /* 從堆疊彈出元素 */
    val pop = stack.pop()
    println("彈出的元素 pop = $pop，彈出後 stack = ${stack.toArray().contentToString()}")

    /* 取得堆疊長度 */
    val size = stack.size()
    println("堆疊長度 size = $size")

    /* 判斷堆疊是否為空 */
    val isEmpty = stack.isEmpty()
    println("堆疊是否為空 = $isEmpty")
}