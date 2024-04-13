/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 大頂堆積 */
class MaxHeap(nums: MutableList<Int>?) {
    // 使用串列而非陣列，這樣無須考慮擴容問題
    private val maxHeap = mutableListOf<Int>()

    /* 建構子，根據輸入串列建堆積 */
    init {
        // 將串列元素原封不動新增進堆積
        maxHeap.addAll(nums!!)
        // 堆積化除葉節點以外的其他所有節點
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 獲取左子節點的索引 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 獲取右子節點的索引 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 獲取父節點的索引 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 向下整除
    }

    /* 交換元素 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* 獲取堆積大小 */
    fun size(): Int {
        return maxHeap.size
    }

    /* 判斷堆積是否為空 */
    fun isEmpty(): Boolean {
        /* 判斷堆積是否為空 */
        return size() == 0
    }

    /* 訪問堆積頂元素 */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 元素入堆積 */
    fun push(_val: Int) {
        // 新增節點
        maxHeap.add(_val)
        // 從底至頂堆積化
        siftUp(size() - 1)
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    private fun siftUp(it: Int) {
        // Kotlin的函式參數不可變，因此建立臨時變數
        var i = it
        while (true) {
            // 獲取節點 i 的父節點
            val p = parent(i)
            // 當“越過根節點”或“節點無須修復”時，結束堆積化
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 交換兩節點
            swap(i, p)
            // 迴圈向上堆積化
            i = p
        }
    }

    /* 元素出堆積 */
    fun pop(): Int {
        // 判空處理
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        swap(0, size() - 1)
        // 刪除節點
        val _val = maxHeap.removeAt(size() - 1)
        // 從頂至底堆積化
        siftDown(0)
        // 返回堆積頂元素
        return _val
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    private fun siftDown(it: Int) {
        // Kotlin的函式參數不可變，因此建立臨時變數
        var i = it
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if (ma == i) break
            // 交換兩節點
            swap(i, ma)
            // 迴圈向下堆積化
            i = ma
        }
    }

    /* 列印堆積（二元樹） */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* 初始化大頂堆積 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n輸入串列並建堆積後")
    maxHeap.print()

    /* 獲取堆積頂元素 */
    var peek = maxHeap.peek()
    print("\n堆積頂元素為 $peek\n")

    /* 元素入堆積 */
    val _val = 7
    maxHeap.push(_val)
    print("\n元素 $_val 入堆積後\n")
    maxHeap.print()

    /* 堆積頂元素出堆積 */
    peek = maxHeap.pop()
    print("\n堆積頂元素 $peek 出堆積後\n")
    maxHeap.print()

    /* 獲取堆積大小 */
    val size = maxHeap.size()
    print("\n堆積元素數量為 $size\n")

    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆積是否為空 $isEmpty\n")
}