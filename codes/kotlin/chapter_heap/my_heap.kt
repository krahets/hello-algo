/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 大顶堆 */
class MaxHeap(nums: MutableList<Int>?) {
    // 使用列表而非数组，这样无须考虑扩容问题
    private val maxHeap = mutableListOf<Int>()

    /* 构造方法，根据输入列表建堆 */
    init {
        // 将列表元素原封不动添加进堆
        maxHeap.addAll(nums!!)
        // 堆化除叶节点以外的其他所有节点
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 获取左子节点的索引 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 获取右子节点的索引 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 获取父节点的索引 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 向下整除
    }

    /* 交换元素 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* 获取堆大小 */
    fun size(): Int {
        return maxHeap.size
    }

    /* 判断堆是否为空 */
    fun isEmpty(): Boolean {
        /* 判断堆是否为空 */
        return size() == 0
    }

    /* 访问堆顶元素 */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 元素入堆 */
    fun push(_val: Int) {
        // 添加节点
        maxHeap.add(_val)
        // 从底至顶堆化
        siftUp(size() - 1)
    }

    /* 从节点 i 开始，从底至顶堆化 */
    private fun siftUp(it: Int) {
        // Kotlin的函数参数不可变，因此创建临时变量
        var i = it
        while (true) {
            // 获取节点 i 的父节点
            val p = parent(i)
            // 当“越过根节点”或“节点无须修复”时，结束堆化
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 交换两节点
            swap(i, p)
            // 循环向上堆化
            i = p
        }
    }

    /* 元素出堆 */
    fun pop(): Int {
        // 判空处理
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        swap(0, size() - 1)
        // 删除节点
        val _val = maxHeap.removeAt(size() - 1)
        // 从顶至底堆化
        siftDown(0)
        // 返回堆顶元素
        return _val
    }

    /* 从节点 i 开始，从顶至底堆化 */
    private fun siftDown(it: Int) {
        // Kotlin的函数参数不可变，因此创建临时变量
        var i = it
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if (ma == i) break
            // 交换两节点
            swap(i, ma)
            // 循环向下堆化
            i = ma
        }
    }

    /* 打印堆（二叉树） */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* 初始化大顶堆 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n输入列表并建堆后")
    maxHeap.print()

    /* 获取堆顶元素 */
    var peek = maxHeap.peek()
    print("\n堆顶元素为 $peek\n")

    /* 元素入堆 */
    val _val = 7
    maxHeap.push(_val)
    print("\n元素 $_val 入堆后\n")
    maxHeap.print()

    /* 堆顶元素出堆 */
    peek = maxHeap.pop()
    print("\n堆顶元素 $peek 出堆后\n")
    maxHeap.print()

    /* 获取堆大小 */
    val size = maxHeap.size()
    print("\n堆元素数量为 $size\n")

    /* 判断堆是否为空 */
    val isEmpty = maxHeap.isEmpty()
    print("\n堆是否为空 $isEmpty\n")
}