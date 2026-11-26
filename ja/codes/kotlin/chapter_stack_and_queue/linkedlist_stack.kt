/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストを使ったスタック */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 先頭ノードをスタックのトップとする
    private var stkSize: Int = 0 // スタックの要素数
) {

    /* スタックの要素数を取得する */
    fun size(): Int {
        return stkSize
    }

    /* スタックが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* プッシュする */
    fun push(num: Int) {
        val node = ListNode(num)
        node.next = stackPeek
        stackPeek = node
        stkSize++
    }

    /* ポップする */
    fun pop(): Int? {
        val num = peek()
        stackPeek = stackPeek?.next
        stkSize--
        return num
    }

    /* スタックのトップを参照する */
    fun peek(): Int? {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return stackPeek?._val
    }

    /* 連結リストを配列に変換して返す */
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

/* 実行例 */
fun main() {
    /* スタックを初期化する */
    val stack = LinkedListStack()

    /* 要素をプッシュする */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)
    println("スタック stack = ${stack.toArray().contentToString()}")

    /* スタックのトップを参照する */
    val peek = stack.peek()!!
    println("スタックのトップの要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()!!
    println("ポップした要素 pop = $pop、ポップ後の stack = ${stack.toArray().contentToString()}")

    /* スタックの要素数を取得する */
    val size = stack.size()
    println("スタックの要素数 size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}