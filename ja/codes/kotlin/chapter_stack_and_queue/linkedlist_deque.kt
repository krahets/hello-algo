/**
 * File: linkedlist_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 双方向連結リストのノード */
class ListNode(var _val: Int) {
    // ノードの値
    var next: ListNode? = null // 次のノードへの参照
    var prev: ListNode? = null // 前のノードへの参照
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
    private var front: ListNode? = null // 先頭ノード front
    private var rear: ListNode? = null // 末尾ノード rear
    private var queSize: Int = 0 // 両端キューの要素数

    /* 両端キューの要素数を取得する */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return size() == 0
    }

    /* 両端キューに要素を追加する */
    fun push(num: Int, isFront: Boolean) {
        val node = ListNode(num)
        // リストが空なら、front と rear の両方が node を指すようにする
        if (isEmpty()) {
            rear = node
            front = rear
            // 先頭に追加する
        } else if (isFront) {
            // node をリストの先頭に追加する
            front?.prev = node
            node.next = front
            front = node // 先頭ノードを更新する
            // 末尾に追加する
        } else {
            // node をリストの末尾に追加する
            rear?.next = node
            node.prev = rear
            rear = node // 末尾ノードを更新する
        }
        queSize++ // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    fun pushFirst(num: Int) {
        push(num, true)
    }

    /* 末尾に追加する */
    fun pushLast(num: Int) {
        push(num, false)
    }

    /* 両端キューから要素を取り出す */
    fun pop(isFront: Boolean): Int {
        if (isEmpty()) 
            throw IndexOutOfBoundsException()
        val _val: Int
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            _val = front!!._val
            front = null
            rear = null
        }
        // 先頭から取り出す
        else if (isFront) {
            _val = front!!._val // 先頭ノードの値を一時的に保存する
            // 先頭ノードを削除する
            val fNext = front!!.next
            fNext!!.prev = null
            front!!.next = null
            front = fNext // 先頭ノードを更新する
            // 末尾から取り出す
        } else {
            _val = rear!!._val // 末尾ノードの値を一時的に保存する
            // 末尾ノードを削除する
            val rPrev = rear!!.prev
            rPrev!!.next = null
            rear!!.prev = null
            rear = rPrev // 末尾ノードを更新する
        }
        queSize-- // 両端キューの要素数を更新する
        return _val
    }

    /* 先頭から取り出す */
    fun popFirst(): Int {
        return pop(true)
    }

    /* 末尾から取り出す */
    fun popLast(): Int {
        return pop(false)
    }

    /* 両端キューの先頭要素を参照する */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return front!!._val
    }

    /* 両端キューの末尾要素を参照する */
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

/* 実行例 */
fun main() {
    /* 両端キューを初期化する */
    val deque = LinkedListDeque()
    deque.pushLast(3)
    deque.pushLast(2)
    deque.pushLast(5)
    println("両端キュー deque = ${deque.toArray().contentToString()}")

    /* 要素を参照する */
    val peekFirst = deque.peekFirst()
    println("先頭要素 peekFirst = $peekFirst")
    val peekLast = deque.peekLast()
    println("末尾要素 peekLast = $peekLast")

    /* 要素を両端キューに追加する */
    deque.pushLast(4)
    println("末尾に 4 を追加した後の deque = ${deque.toArray().contentToString()}")
    deque.pushFirst(1)
    println("先頭に 1 を追加した後の deque = ${deque.toArray().contentToString()}")

    /* 両端キューから要素を取り出す */
    val popLast = deque.popLast()
    println("末尾から取り出した要素 = ${popLast}、末尾から取り出した後の deque = ${deque.toArray().contentToString()}")
    val popFirst = deque.popFirst()
    println("先頭から取り出した要素 = ${popFirst}、先頭から取り出した後の deque = ${deque.toArray().contentToString()}")

    /* 両端キューの要素数を取得する */
    val size = deque.size()
    println("両端キューの要素数 size = $size")

    /* 両端キューが空かどうかを判定する */
    val isEmpty = deque.isEmpty()
    println("両端キューは空か = $isEmpty")
}