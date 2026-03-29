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
    // 配列ではなくリストを使うことで、拡張を考慮する必要がない
    private val maxHeap = mutableListOf<Int>()

    /* コンストラクタ。入力リストに基づいてヒープを構築する */
    init {
        // リスト要素をそのままヒープに追加
        maxHeap.addAll(nums!!)
        // 葉ノード以外のすべてのノードをヒープ化
        for (i in parent(size() - 1) downTo 0) {
            siftDown(i)
        }
    }

    /* 左子ノードのインデックスを取得 */
    private fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    private fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    private fun parent(i: Int): Int {
        return (i - 1) / 2 // 切り捨て除算
    }

    /* 要素を交換 */
    private fun swap(i: Int, j: Int) {
        val temp = maxHeap[i]
        maxHeap[i] = maxHeap[j]
        maxHeap[j] = temp
    }

    /* ヒープのサイズを取得 */
    fun size(): Int {
        return maxHeap.size
    }

    /* ヒープが空かどうかを判定 */
    fun isEmpty(): Boolean {
        /* ヒープが空かどうかを判定 */
        return size() == 0
    }

    /* ヒープ先頭要素にアクセス */
    fun peek(): Int {
        return maxHeap[0]
    }

    /* 要素をヒープに追加 */
    fun push(_val: Int) {
        // ノードを追加
        maxHeap.add(_val)
        // 下から上へヒープ化
        siftUp(size() - 1)
    }

    /* ノード i から始めて、下から上へヒープ化 */
    private fun siftUp(it: Int) {
        // Kotlin の関数引数は不変のため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i の親ノードを取得
            val p = parent(i)
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap[i] <= maxHeap[p]) break
            // 2 つのノードを交換
            swap(i, p)
            // ループで下から上へヒープ化
            i = p
        }
    }

    /* 要素をヒープから取り出す */
    fun pop(): Int {
        // 空判定の処理
        if (isEmpty()) throw IndexOutOfBoundsException()
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(0, size() - 1)
        // ノードを削除
        val _val = maxHeap.removeAt(size() - 1)
        // 上から下へヒープ化
        siftDown(0)
        // ヒープ先頭要素を返す
        return _val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    private fun siftDown(it: Int) {
        // Kotlin の関数引数は不変のため、一時変数を作成する
        var i = it
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            val l = left(i)
            val r = right(i)
            var ma = i
            if (l < size() && maxHeap[l] > maxHeap[ma]) ma = l
            if (r < size() && maxHeap[r] > maxHeap[ma]) ma = r
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i) break
            // 2 つのノードを交換
            swap(i, ma)
            // ループで上から下へヒープ化
            i = ma
        }
    }

    /* ヒープ（二分木）を出力 */
    fun print() {
        val queue = PriorityQueue { a: Int, b: Int -> b - a }
        queue.addAll(maxHeap)
        printHeap(queue)
    }
}

/* Driver Code */
fun main() {
    /* 最大ヒープを初期化 */
    val maxHeap = MaxHeap(mutableListOf(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2))
    println("\n入力リストからヒープを構築した後")
    maxHeap.print()

    /* ヒープ頂点の要素を取得 */
    var peek = maxHeap.peek()
    print("\nヒープ先頭要素は $peek\n")

    /* 要素をヒープに追加 */
    val _val = 7
    maxHeap.push(_val)
    print("\n要素 $_val をヒープに追加した後\n")
    maxHeap.print()

    /* ヒープ頂点の要素を取り出す */
    peek = maxHeap.pop()
    print("\nヒープ先頭要素 $peek を取り出した後\n")
    maxHeap.print()

    /* ヒープのサイズを取得 */
    val size = maxHeap.size()
    print("\nヒープ要素数は $size\n")

    /* ヒープが空かどうかを判定 */
    val isEmpty = maxHeap.isEmpty()
    print("\nヒープが空かどうか $isEmpty\n")
}