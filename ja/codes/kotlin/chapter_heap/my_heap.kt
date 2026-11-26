/**
 * File: my_heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 最大ヒープ */
class MaxHeap(nums: MutableList<Int>?) {
    // 配列の代わりにリストを使えば、容量の拡張を自分で扱う必要がない
    private val maxHeap = mutableListOf<Int>()

    /* 入力リストからヒープを構築するコンストラクタ */
    init {
        // リストの要素をそのままヒープに追加する
        maxHeap.addAll(nums!!)
        // 葉以外のすべてのノードをヒープ化する
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 左の子のインデックスを取得する */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 右の子のインデックスを取得する */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 親のインデックスを取得する */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 商を 0 方向に丸める
    }

    /* 要素を交換する */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* ヒープのサイズを取得する */
    fun size(): Int {
        return maxHeap.size
    }

    /* ヒープが空か判定する */
    fun isEmpty(): Boolean {
        /* ヒープが空か判定する */
        return size() == 0
    }

    /* ヒープの根の要素を参照する */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 要素をヒープに挿入する */
    fun push(_val: Int) {
        // ノードを追加する
        maxHeap.add(_val)
        // 上に向かってヒープ化する
        siftUp(size() - 1)
    }

    /* ノード i から上に向かってヒープ化する */
    private fun siftUp(it: Int) {
        // Kotlin の関数の引数には再代入できないため、一時変数を作る
        var i = it
        while (true) {
            // ノード i の親を取得する
            val p = parent(i)
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 2 つのノードを交換する
            swap(i, p)
            // 上へのヒープ化を繰り返す
            i = p
        }
    }

    /* 根の要素をヒープから取り出す */
    fun pop(): Int {
        // 空の場合の処理
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        swap(0, size() - 1)
        // ノードを削除する
        val _val = maxHeap.removeAt(size() - 1)
        // 下に向かってヒープ化する
        siftDown(0)
        // 根の要素を返す
        return _val
    }

    /* ノード i から下に向かってヒープ化する */
    private fun siftDown(it: Int) {
        // Kotlin の関数の引数には再代入できないため、一時変数を作る
        var i = it
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if (ma == i) break
            // 2 つのノードを交換する
            swap(i, ma)
            // 下へのヒープ化を繰り返す
            i = ma
        }
    }

    /* ヒープを二分木として表示する */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* 実行例 */
fun main() {
    /* 最大ヒープを初期化する */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n入力リストから構築したヒープ：")
    maxHeap.print()

    /* ヒープの根の要素を取得する */
    var peek = maxHeap.peek()
    print("\nヒープの根の要素：$peek\n")

    /* 要素をヒープに挿入する */
    val _val = 7
    maxHeap.push(_val)
    print("\n要素 $_val の挿入後：\n")
    maxHeap.print()

    /* 根の要素を取り出す */
    peek = maxHeap.pop()
    print("\n根の要素 $peek を取り出した後：\n")
    maxHeap.print()

    /* ヒープのサイズを取得する */
    val size = maxHeap.size()
    print("\nヒープの要素数：$size\n")

    /* ヒープが空か判定する */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープは空か：$isEmpty\n")
}