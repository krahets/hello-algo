/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストベースのキュー */
class LinkedListQueue(
    // 先頭ノード front、末尾ノード rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* キューが空かどうかを判定 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* エンキュー */
    fun push(num: Int) {
        // 末尾ノードの後ろに num を追加
        val node = ListNode(num)
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if (front == null) {
            front = node
            rear = node
            // キューが空でなければ、そのノードを末尾ノードの後ろに追加
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* デキュー */
    fun pop(): Int {
        val num = peek()
        // 先頭ノードを削除
        front = front?.next
        queSize--
        return num
    }

    /* キュー先頭の要素にアクセス */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 連結リストを Array に変換して返す */
    fun toArray(): IntArray {
        var node = front
        val res = IntArray(size())
        for (i in res.indices) {
            res[i] = node!!._val
            node = node.next
        }
        return res
    }
}

/* Driver Code */
fun main() {
    /* キューを初期化 */
    val queue = LinkedListQueue()

    /* 要素をエンキュー */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("キュー queue = ${queue.toArray().contentToString()}")

    /* キュー先頭の要素にアクセス */
    val peek = queue.peek()
    println("先頭要素 peek = $peek")

    /* 要素をデキュー */
    val pop = queue.pop()
    println("デキューした要素 pop = $pop、デキュー後 queue = ${queue.toArray().contentToString()}")

    /* キューの長さを取得 */
    val size = queue.size()
    println("キューの長さ size = $size")

    /* キューが空かどうかを判定 */
    val isEmpty = queue.isEmpty()
    println("キューが空かどうか = $isEmpty")
}