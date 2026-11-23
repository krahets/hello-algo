/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列で実装したキュー */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // キューの要素を格納する配列
    private var front: Int = 0 // キューの先頭要素を指す先頭ポインタ
    private var queSize: Int = 0 // キューの長さ

    /* キューの容量を取得する */
    fun capacity(): Int {
        return nums.size
    }

    /* キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* キューが空か判定 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* エンキュー */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("キューが満杯です")
            return
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        val rear = (front + queSize) % capacity()
        // num をキューの末尾に追加する
        nums[rear] = num
        queSize++
    }

    /* デキュー */
    fun pop(): Int {
        val num = peek()
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* キューの先頭要素にアクセス */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 配列を返す */
    fun toArray(): IntArray {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
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

/* 実行用コード */
fun main() {
    /* キューを初期化する */
    val capacity = 10
    val queue = ArrayQueue(capacity)

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
    println("デキューした要素 pop = ${pop}、デキュー後 queue =  ${queue.toArray().contentToString()}")

    /* キューの長さを取得 */
    val size = queue.size()
    println("キューの長さ size = $size")

    /* キューが空か判定 */
    val isEmpty = queue.isEmpty()
    println("キューは空か = $isEmpty")

    /* 循環配列をテストする */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i 回のエンキューとデキューの後 queue = ${queue.toArray().contentToString()}")
    }
}