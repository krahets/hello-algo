/**
 * File: array_queue.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_stack_and_queue

/* 循環配列ベースのキュー */
class ArrayQueue(capacity: Int) {
    private val nums: IntArray = IntArray(capacity) // キュー要素を格納する配列
    private var front: Int = 0 // 先頭ポインタ。先頭要素を指す
    private var queSize: Int = 0 // キューの長さ

    /* キューの容量を取得 */
    fun capacity(): Int {
        return nums.size
    }

    /* キューの長さを取得 */
    fun size(): Int {
        return queSize
    }

    /* キューが空かどうかを判定 */
    fun isEmpty(): Boolean {
        return queSize == 0
    }

    /* エンキュー */
    fun push(num: Int) {
        if (queSize == capacity()) {
            println("キューは満杯です")
            return
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        val rear = (front + queSize) % capacity()
        // num をキュー末尾に追加
        nums[rear] = num
        queSize++
    }

    /* デキュー */
    fun pop(): Int {
        val num = peek()
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        front = (front + 1) % capacity()
        queSize--
        return num
    }

    /* キュー先頭の要素にアクセス */
    fun peek(): Int {
        if (isEmpty()) throw IndexOutOfBoundsException()
        return nums[front]
    }

    /* 配列を返す */
    fun toArray(): IntArray {
        // 有効長の範囲内のリスト要素のみを変換
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

/* Driver Code */
fun main() {
    /* キューを初期化 */
    val capacity = 10
    val queue = ArrayQueue(capacity)

    /* 要素をエンキュー */
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    println("キュー queue = ${queue.toArray().contentToString()}")

    /* キュー先頭の要素にアクセス */
    val peek = queue.peek()
    println("先頭要素 peek = $peek")

    /* 要素をデキュー */
    val pop = queue.pop()
    println("取り出した要素 pop = ${pop}、取り出した後 queue =  ${queue.toArray().contentToString()}")

    /* キューの長さを取得 */
    val size = queue.size()
    println("キューの長さ size = $size")

    /* キューが空かどうかを判定 */
    val isEmpty = queue.isEmpty()
    println("キューが空かどうか = $isEmpty")

    /* 循環配列をテストする */
    for (i in 0..9) {
        queue.push(i)
        queue.pop()
        println("第 $i ラウンドの追加 + 取り出し後 queue = ${queue.toArray().contentToString()}")
    }
}