/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 双方向連結リストノード */
class ListNode(var _val: Int) {
    // ノード値
    var next: ListNode? = null // 後続ノードへの参照
    var prev: ListNode? = null // 前駆ノードへの参照
}

/* 双方向連結リストベースの両端キュー */
class LinkedListDeque {
    private var front: ListNode? = null // 先頭ノード front
    private var rear: ListNode? = null // 末尾ノード rear
    private var queSize: Int = 0 // 両端キューの長さ

    /* 両端キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定 */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* エンキュー操作 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (isEmpty()) {
            rear = node
            front = rear
            // 先頭へのエンキュー操作
        } else if (isFront) {
            // node を連結リストの先頭に追加
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
            // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        queSize++ // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* キュー末尾にエンキュー */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* デキュー操作 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // キュー先頭からの取り出し
        if (isFront) {
            _val = front!!._val // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            val fNext = front!!.next
            if (fNext != null) {
                fNext.prev = null
                front!!.next = null
            }
            front = fNext // 先頭ノードを更新する
            // キュー末尾からの取り出し
        } else {
            _val = rear!!._val // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            val rPrev = rear!!.prev
            if (rPrev != null) {
                rPrev.next = null
                rear!!.prev = null
            }
            rear = rPrev // 末尾ノードを更新する
        }
        queSize-- // キューの長さを更新
        return _val
    }

    /* キュー先頭からデキュー */
    fun popFirst(): Int {
        return pop(true)
    }

    /* キュー末尾からデキュー */
    fun popLast(): Int {
        return pop(false)
    }

    /* キュー先頭の要素にアクセス */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* キュー末尾の要素にアクセス */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 出力用の配列を返す */
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
    /* 両端キューを初期化 */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("双方向キュー deque = ${deque.toArray().contentToString()}")

    /* 要素にアクセス */
    val peekFirst = deque.peekFirst()
    println("先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("末尾要素 peekLast = $peekLast")

    /* 要素をエンキュー */
    deque.pushLast(4)
    println("要素 4 を末尾に追加した後 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("要素 1 を先頭に追加した後 deque = ${deque.toArray().contentToString()}")

    /* 要素をデキュー */
    val popLast = deque.popLast()
    println("末尾から取り出した要素 = ${popLast}、末尾から取り出した後 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("先頭から取り出した要素 = ${popFirst}、先頭から取り出した後 deque = ${deque.toArray().contentToString()}")

    /* 両端キューの長さを取得 */
    val size = deque.size()
    println("双方向キューの長さ size = $size")

    /* 両端キューが空かどうかを判定 */
    val isEmpty = deque.isEmpty()
    println("双方向キューが空かどうか = $isEmpty")
}