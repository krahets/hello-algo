/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 双方向連結リストのノード */
class ListNode(var _val: Int) {
    // ノードの値
    var next: ListNode? = null // 後続ノードへの参照
    var prev: ListNode? = null // 前のノードへの参照
}

/* 双方向連結リストで実装した両端キュー */
class LinkedListDeque {
    private var front: ListNode? = null // 先頭ノード front
    private var rear: ListNode? = null // 末尾ノード rear
    private var queSize: Int = 0 // 両端キューの長さ

    /* 両端キューの長さを取得する */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* エンキュー操作 */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (isEmpty()) {
            rear = node
            front = rear
            // 先頭へのエンキュー操作
        } else if (isFront) {
            // node を連結リストの先頭に追加する
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
            // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加する
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        queSize++ // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 末尾にエンキューする */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* デキュー操作 */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // 先頭からのデキュー操作
        else if (isFront) {
            _val = front!!._val // 先頭ノードの値を一時保存する
            // 先頭ノードを削除する
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // 先頭ノードを更新する
            // 末尾からのデキュー操作
        } else {
            _val = rear!!._val // 末尾ノードの値を一時保存する
            // 末尾ノードを削除する
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // 末尾ノードを更新する
        }
        queSize-- // キューの長さを更新する
        return _val
    }

    /* 先頭からデキューする */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 末尾からデキューする */
    fun popLast(): Int {
        return pop(false)
    }

    /* キューの先頭要素にアクセス */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* キューの末尾要素にアクセスする */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return rear!!._val
    }

    /* 表示用の配列を返す */
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
    /* 両端キューを初期化する */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("両端キュー deque = ${deque.toArray().contentToString()}")

    /* 要素にアクセスする */
    val peekFirst = deque.peekFirst()
    println("キューの先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("キューの末尾要素 peekLast = $peekLast")

    /* 要素をエンキューする */
    deque.pushLast(4)
    println("要素 4 を末尾にエンキューした後 deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("要素 1 を先頭にエンキューした後 deque = ${deque.toArray().contentToString()}")

    /* 要素をデキューする */
    val popLast = deque.popLast()
    println("末尾からデキューした要素 = ${popLast}、末尾からデキューした後 deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("先頭からデキューした要素 = ${popFirst}、先頭からデキューした後 deque = ${deque.toArray().contentToString()}")

    /* 両端キューの長さを取得する */
    val size = deque.size()
    println("両端キューの長さ size = $size")

    /* 両端キューが空かどうかを判定する */
    val isEmpty = deque.isEmpty()
    println("両端キューは空か = $isEmpty")
}