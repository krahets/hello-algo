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
    // 配列ではなくリストを使うため、容量の拡張を考慮する必要がない
    private val maxHeap = mutableListOf<Int>()

    /* コンストラクタ：入力リストからヒープを構築する */
    init {
        // リストの要素をそのままヒープに追加する
        maxHeap.addAll(nums!!)
        // 葉ノード以外の全ノードをヒープ化する
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 左の子のインデックスを取得 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 親のインデックスを取得 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 切り捨て除算
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

    /* ヒープが空か判定 */
    fun isEmpty(): Boolean {
        /* ヒープが空か判定 */
        return size() == 0
    }

    /* ヒープの先頭要素にアクセスする */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* ヒープに要素を挿入する */
    fun push(_val: Int) {
        // ノードを追加する
        maxHeap.add(_val)
        // 下から上へヒープ化する
        siftUp(size() - 1)
    }

    /* ノード i から上向きにヒープ化する */
    private fun siftUp(it: Int) {
        // Kotlin の関数の引数は変更できないため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i の親ノードを取得する
            val p = parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 2 つのノードを交換する
            swap(i, p)
            // 上向きのヒープ化を繰り返す
            i = p
        }
    }

    /* ヒープから要素を取り出す */
    fun pop(): Int {
        // 空かどうかを確認する
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1)
        // ノードを削除する
        val _val = maxHeap.removeAt(size() - 1)
        // 上から下へヒープ化する
        siftDown(0)
        // ヒープの先頭要素を返す
        return _val
    }

    /* ノード i から下向きにヒープ化する */
    private fun siftDown(it: Int) {
        // Kotlin の関数の引数は変更できないため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i) break
            // 2 つのノードを交換する
            swap(i, ma)
            // 下向きのヒープ化を繰り返す
            i = ma
        }
    }

    /* ヒープ（二分木）を表示する */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* 実行用コード */
fun main() {
    /* 最大ヒープを初期化する */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\nリストを入力してヒープを構築した後")
    maxHeap.print()

    /* ヒープの先頭要素を取得する */
    var peek = maxHeap.peek()
    print("\nヒープの先頭要素は $peek\n")

    /* ヒープに要素を挿入する */
    val _val = 7
    maxHeap.push(_val)
    print("\n要素 $_val をヒープに挿入した後\n")
    maxHeap.print()

    /* ヒープの先頭要素を取り出す */
    peek = maxHeap.pop()
    print("\nヒープの先頭要素 $peek を取り出した後\n")
    maxHeap.print()

    /* ヒープのサイズを取得する */
    val size = maxHeap.size()
    print("\nヒープの要素数は $size\n")

    /* ヒープが空か判定 */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープは空か $isEmpty\n")
}