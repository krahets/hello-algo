/**
 * File: linkedlist_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 連結リストを使ったキュー */
class LinkedListQueue(
    // front は先頭ノード、rear は末尾ノードを指す
    private var front: ListNode? = null,
    private var rear: ListNode? = null,
    private var queSize: Int = 0
) {

    /* キューの要素数を取得する */
    fun size(): Int {
        return queSize
    }

    /* キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* エンキューする */
    fun push(num: Int) {
        // 値が num のノードを末尾ノードの後ろに追加する
        val node = ListNode(num)
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node
            rear = node
            // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        } else {
            rear?.next = node
            rear = node
        }
        queSize++
    }

    /* デキューする */
    fun pop(): Int {
        val num = peek()
        // 先頭ノードを削除する
        front = front?.next
        queSize--
        return num
    }

    /* キューの先頭要素を参照する */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 連結リストを配列に変換して返す */
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

/* 実行例 */
fun main() {
    /* キューを初期化する */
    val queue = LinkedListQueue()

    /* 要素をキューに追加する */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("キュー queue = ${queue.toArray().contentToString()}")

    /* キューの先頭要素を参照する */
    val peek = queue.peek()
    println("先頭要素 peek = $peek")

    /* キューから要素を取り出す */
    val pop = queue.pop()
    println("デキューした要素 pop = $pop、デキュー後の queue = ${queue.toArray().contentToString()}")

    /* キューの要素数を取得する */
    val size = queue.size()
    println("キューの要素数 size = $size")

    /* キューが空かどうかを判定する */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")
}