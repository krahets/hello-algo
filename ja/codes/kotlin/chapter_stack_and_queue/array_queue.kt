/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列を使ったキュー */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // キューの要素を格納する配列
    private var front: Int = 0 // キューの先頭要素を指すインデックス
    private var queSize: Int = 0 // キューの要素数

    /* キューの容量を取得する */
    fun capacity(): Int {
        return nums.size
    }

    /* キューの要素数を取得する */
    fun size(): Int {
        return queSize
    }

    /* キューが空かどうかを判定する */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* エンキューする */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("キューが満杯です")
            return
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        val rear = (front + queSize) % capacity()
        // num をキューの末尾に追加する
        nums[rear] = num
        queSize++
    }

    /* デキューする */
    fun pop(): Int {
        val num = peek()
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* キューの先頭要素を参照する */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 配列を返す */
    fun toArray(): IntArray {
        // キューの要素数に当たる範囲だけを変換する
        val res = IntArray(queSize)
        var i = 0
        var j = front
        while (i < queSize) {
            res[i] = nums[j % capacity()]
            i++
            j++
        }
        return res
    }
}

/* 実行例 */
fun main() {
    /* キューを初期化する */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("デキューした要素 pop = ${pop}、デキュー後の queue =  ${queue.toArray().contentToString()}")

    /* キューの要素数を取得する */
    val size = queue.size()
    println("キューの要素数 size = $size")

    /* キューが空かどうかを判定する */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")

    /* 循環配列の動作を確認する */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i 回のエンキューとデキューを終えた後の queue = ${queue.toArray().contentToString()}")
    }
}