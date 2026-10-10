/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストベースのスタック */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 先頭ノードをスタックトップとする
    private var stkSize: Int = 0 // スタックの長さ
) {

    /* スタックの長さを取得 */
    fun size(): Int {
        return stkSize
    }

    /* スタックが空かどうかを判定 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* プッシュ */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* ポップ */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* スタックトップの要素にアクセス */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* List を Array に変換して返す */
    fun toArray(): IntArray {
        var node = stackPeek
        val res = IntArray(size())
        for (i in res.size - 1 downTo 0) {
            res[i] = node?._val!!
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* スタックを初期化 */
    val stack = LinkedListStack()

    /* 要素をプッシュ */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("スタック stack = ${stack.toArray().contentToString()}")

    /* スタックトップの要素にアクセス */
    val peek = stack.peek()!!
    println("スタックトップ要素 peek = $peek")

    /* 要素をポップ */
    val pop = stack.pop()!!
    println("ポップした要素 pop = $pop、ポップ後の stack = ${stack.toArray().contentToString()}")

    /* スタックの長さを取得 */
    val size = stack.size()
    println("スタックの長さ size = $size")

    /* 空かどうかを判定 */
    val isEmpty = stack.isEmpty()
    println("スタックが空かどうか = $isEmpty")
}