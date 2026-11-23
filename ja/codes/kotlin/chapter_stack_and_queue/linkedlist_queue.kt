/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストで実装したキュー */
class LinkedListQueue(
    // 先頭ノード front 、末尾ノード rear
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* キューが空か判定 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* エンキュー */
    fun push(num: Int) {
        // 末尾ノードの後ろに num を追加する
        val node = ListNode(num)
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node
            rear = node
            // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* デキュー */
    fun pop(): Int {
        val num = peek()
        // 先頭ノードを削除する
        front = front?.next
        queSize--
        return num
    }

    /* キューの先頭要素にアクセス */
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

/* 実行用コード */
fun main() {
    /* キューを初期化する */
    val queue = LinkedListQueue()

    /* 要素をエンキューする */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("キュー queue = ${queue.toArray().contentToString()}")

    /* キューの先頭要素にアクセス */
    val peek = queue.peek()
    println("キューの先頭要素 peek = $peek")

    /* 要素をデキューする */
    val pop = queue.pop()
    println("デキューした要素 pop = $pop、デキュー後 queue = ${queue.toArray().contentToString()}")

    /* キューの長さを取得 */
    val size = queue.size()
    println("キューの長さ size = $size")

    /* キューが空か判定 */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")
}