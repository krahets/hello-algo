/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列で実装した両端キュー */
/* コンストラクタ */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 両端キューの要素を格納する配列
    private var front: Int = 0 // キューの先頭要素を指す先頭ポインタ
    private var queSize: Int = 0 // 両端キューの長さ

    /* 両端キューの容量を取得する */
    fun capacity(): Int {
        return nums.size
    }

    /* 両端キューの長さを取得する */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 循環配列のインデックスを計算する */
    private fun index(i: Int): Int {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + capacity()) % capacity()
    }

    /* 先頭にエンキューする */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("両端キューが満杯です")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        front = index(front - 1)
        // num をキューの先頭に追加する
        nums[front] = num
        queSize++
    }

    /* 末尾にエンキューする */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("両端キューが満杯です")
            return
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        val rear = index(front + queSize)
        // num をキューの末尾に追加する
        nums[rear] = num
        queSize++
    }

    /* 先頭からデキューする */
    fun popFirst(): Int {
        val num = peekFirst()
        // 先頭ポインタを後ろに 1 つ移動する
        front = index(front + 1)
        queSize--
        return num
    }

    /* 末尾からデキューする */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* キューの先頭要素にアクセス */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* キューの末尾要素にアクセスする */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 末尾要素のインデックスを計算する
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 表示用の配列を返す */
    fun toArray(): IntArray {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
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

/* 実行用コード */
fun main() {
    /* 両端キューを初期化する */
    val deque = ArrayDeque(10)
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