/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列を使った両端キュー */
/* コンストラクタ */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 両端キューの要素を格納する配列
    private var front: Int = 0 // 両端キューの先頭要素を指すインデックス
    private var queSize: Int = 0 // 両端キューの要素数

    /* 両端キューの容量を取得する */
    fun capacity(): Int {
        return nums.size
    }

    /* 両端キューの要素数を取得する */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 循環配列のインデックスを求める */
    private fun index(i: Int): Int {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        return (i + capacity()) % capacity()
    }

    /* 先頭に追加する */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("両端キューが満杯です")
            return
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        front = index(front - 1)
        // num を両端キューの先頭に追加する
        nums[front] = num
        queSize++
    }

    /* 末尾に追加する */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("両端キューが満杯です")
            return
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        val rear = index(front + queSize)
        // num を両端キューの末尾に追加する
        nums[rear] = num
        queSize++
    }

    /* 先頭から取り出す */
    fun popFirst(): Int {
        val num = peekFirst()
        // 先頭のインデックスを 1 つ進める
        front = index(front + 1)
        queSize--
        return num
    }

    /* 末尾から取り出す */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* 両端キューの先頭要素を参照する */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 両端キューの末尾要素を参照する */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 末尾要素のインデックスを求める
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 表示用の配列を返す */
    fun toArray(): IntArray {
        // 両端キューの要素数に当たる範囲だけを変換する
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[index(j)]
            i++
            j++
        }
        return res
    }
}

/* 実行例 */
fun main() {
    /* 両端キューを初期化する */
    val deque = ArrayDeque(10)
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