/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 最大堆積 */
class MaxHeap(nums: MutableList<Int>?) {
    // 採用可擴充的串列取代陣列，無須自行處理擴充容量的問題
    private val maxHeap = mutableListOf<Int>()

    /* 建構式，根據輸入串列建立堆積 */
    init {
        // 將串列元素依原順序全部加入堆積
        maxHeap.addAll(nums!!)
        // 從每個非葉節點向下調整堆積
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 取得左子節點的索引 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 取得右子節點的索引 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 取得父節點的索引 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 向下取整的整數除法
    }

    /* 交換元素 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* 取得堆積大小 */
    fun size(): Int {
        return maxHeap.size
    }

    /* 判斷堆積是否為空 */
    fun isEmpty(): Boolean {
        /* 判斷堆積是否為空 */
        return size() == 0
    }

    /* 讀取堆積頂端元素 */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 將元素加入堆積 */
    fun push(_val: Int) {
        // 新增節點
        maxHeap.add(_val)
        // 由下往上調整堆積
        siftUp(size() - 1)
    }

    /* 從節點 i 開始向上調整堆積 */
    private fun siftUp(it: Int) {
        // Kotlin 的函式參數不能重新指派，因此建立暫存變數
        var i = it
        while (true) {
            // 取得節點 i 的父節點
            val p = parent(i)
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 交換兩個節點
            swap(i, p)
            // 繼續向上調整堆積
            i = p
        }
    }

    /* 從堆積取出元素 */
    fun pop(): Int {
        // 檢查堆積是否為空
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(0, size() - 1)
        // 刪除節點
        val _val = maxHeap.removeAt(size() - 1)
        // 由上往下調整堆積
        siftDown(0)
        // 回傳堆積頂端元素
        return _val
    }

    /* 從節點 i 開始向下調整堆積 */
    private fun siftDown(it: Int) {
        // Kotlin 的函式參數不能重新指派，因此建立暫存變數
        var i = it
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i) break
            // 交換兩個節點
            swap(i, ma)
            // 繼續向下調整堆積
            i = ma
        }
    }

    /* 印出堆積（二元樹） */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* 初始化最大堆積 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n用輸入串列建立堆積後")
    maxHeap.print()

    /* 取得堆積頂端元素 */
    var peek = maxHeap.peek()
    print("\n堆積頂端元素為 $peek\n")

    /* 將元素加入堆積 */
    val _val = 7
    maxHeap.push(_val)
    print("\n將元素 $_val 加入堆積後\n")
    maxHeap.print()

    /* 取出堆積頂端元素 */
    peek = maxHeap.pop()
    print("\n取出堆積頂端元素 $peek 後\n")
    maxHeap.print()

    /* 取得堆積大小 */
    val size = maxHeap.size()
    print("\n堆積中的元素個數為 $size\n")

    /* 判斷堆積是否為空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆積是否為空 $isEmpty\n")
}