/**
 * File: array_deque.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列ベースの両端キュー */
/* コンストラクタ */
class ArrayDeque(capacity: Int) {
    private var nums: IntArray = IntArray(capacity) // 両端キューの要素を格納する配列
    private var front: Int = 0 // 先頭ポインタ。先頭要素を指す
    private var queSize: Int = 0 // 両端キューの長さ

    /* 両端キューの容量を取得 */
    fun capacity(): Int {
        return nums.size
    }

    /* 両端キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* 両端キューが空かどうかを判定 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* 循環配列のインデックスを計算 */
    private fun index(i: Int): Int {
        // 剰余演算により配列の先頭と末尾をつなげる
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + capacity()) % capacity()
    }

    /* キュー先頭にエンキュー */
    fun pushFirst(num: Int) {
        if (queSize == capacity()) {
            println("双方向キューは満杯です")
            return
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        front = index(front - 1)
        // num をキュー先頭に追加
        nums[front] = num
        queSize++
    }

    /* キュー末尾にエンキュー */
    fun pushLast(num: Int) {
        if (queSize == capacity()) {
            println("双方向キューは満杯です")
            return
        }
        // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        val rear = index(front + queSize)
        // num をキュー末尾に追加
        nums[rear] = num
        queSize++
    }

    /* キュー先頭からデキュー */
    fun popFirst(): Int {
        val num = peekFirst()
        // 先頭ポインタを 1 つ後ろへ進める
        front = index(front + 1)
        queSize--
        return num
    }

    /* キュー末尾からデキュー */
    fun popLast(): Int {
        val num = peekLast()
        queSize--
        return num
    }

    /* キュー先頭の要素にアクセス */
    fun peekFirst(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* キュー末尾の要素にアクセス */
    fun peekLast(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 末尾要素のインデックスを計算
        val last = index(front + queSize - 1)
        return nums[last]
    }

    /* 出力用の配列を返す */
    fun toArray(): IntArray {
        // 有効長の範囲内のリスト要素のみを変換
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

/* Driver Code */
fun main() {
    /* 両端キューを初期化 */
    val deque = ArrayDeque(10)
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