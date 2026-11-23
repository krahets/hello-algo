/**
 * File: linkedlist_stack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストで実装したスタック */
class LinkedListStack(
    private var stackPeek: ListNode? = null, // 先頭ノードをスタックの先頭とする
    private var stkSize: Int = 0 // スタックの長さ
) {

    /* スタックの長さを取得する */
    fun size(): Int {
        return stkSize
    }

    /* スタックが空かどうかを判定する */
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

    /* スタックの先頭要素にアクセスする */
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

/* 実行用コード */
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

    /* スタックの先頭要素にアクセスする */
    val peek = stack.peek()!!
    println("スタックの先頭要素 peek = $peek")

    /* 要素をポップする */
    val pop = stack.pop()!!
    println("ポップした要素 pop = $pop、ポップ後 stack = ${stack.toArray().contentToString()}")

    /* スタックの長さを取得する */
    val size = stack.size()
    println("スタックの長さ size = $size")

    /* 空かどうかを判定する */
    val isEmpty = stack.isEmpty()
    println("スタックは空か = $isEmpty")
}