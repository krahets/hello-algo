/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 最大ヒープ */
class MaxHeap {
    private var maxHeap: [Int]

    /* コンストラクタ。入力リストに基づいてヒープを構築する */
    init(nums: [Int]) {
        // リスト要素をそのままヒープに追加
        maxHeap = nums
        // 葉ノード以外のすべてのノードをヒープ化
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 左子ノードのインデックスを取得 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 右子ノードのインデックスを取得 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 親ノードのインデックスを取得 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 切り捨て除算
    }

    /* 要素を交換 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* ヒープのサイズを取得 */
    func size() -> Int {
        maxHeap.count
    }

    /* ヒープが空かどうかを判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* ヒープ先頭要素にアクセス */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 要素をヒープに追加 */
    func push(val: Int) {
        // ノードを追加
        maxHeap.append(val)
        // 下から上へヒープ化
        siftUp(i: size() - 1)
    }

    /* ノード i から始めて、下から上へヒープ化 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // ノード i の親ノードを取得
            let p = parent(i: i)
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 2 つのノードを交換
            swap(i: i, j: p)
            // ループで下から上へヒープ化
            i = p
        }
    }

    /* 要素をヒープから取り出す */
    func pop() -> Int {
        // 空判定の処理
        if isEmpty() {
            fatalError("ヒープが空です")
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(i: 0, j: size() - 1)
        // ノードを削除
        let val = maxHeap.remove(at: size() - 1)
        // 上から下へヒープ化
        siftDown(i: 0)
        // ヒープ先頭要素を返す
        return val
    }

    /* ノード i から始めて、上から下へヒープ化 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // ノード i, l, r のうち値が最大のノードを ma とする
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if ma == i {
                break
            }
            // 2 つのノードを交換
            swap(i: i, j: ma)
            // ループで上から下へヒープ化
            i = ma
        }
    }

    /* ヒープ（二分木）を出力 */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* 最大ヒープを初期化 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nリストを入力してヒープを構築した後")
        maxHeap.print()

        /* ヒープ頂点の要素を取得 */
        var peek = maxHeap.peek()
        print("\nヒープ先頭要素は \(peek)")

        /* 要素をヒープに追加 */
        let val = 7
        maxHeap.push(val: val)
        print("\n要素 \(val) をヒープに追加した後")
        maxHeap.print()

        /* ヒープ頂点の要素を取り出す */
        peek = maxHeap.pop()
        print("\nヒープ先頭要素 \(peek) を取り出した後")
        maxHeap.print()

        /* ヒープのサイズを取得 */
        let size = maxHeap.size()
        print("\nヒープ内の要素数は \(size)")

        /* ヒープが空かどうかを判定 */
        let isEmpty = maxHeap.isEmpty()
        print("\nヒープが空かどうか \(isEmpty)")
    }
}
