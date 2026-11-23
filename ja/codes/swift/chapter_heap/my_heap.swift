/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 最大ヒープ */
class MaxHeap {
    private var maxHeap: [Int]

    /* コンストラクタ：入力リストからヒープを構築する */
    init(nums: [Int]) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums
        // 葉ノード以外の全ノードをヒープ化する
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 左の子のインデックスを取得 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 右の子のインデックスを取得 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 親のインデックスを取得 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 切り捨て除算
    }

    /* 要素を交換する */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* ヒープのサイズを取得する */
    func size() -> Int {
        maxHeap.count
    }

    /* ヒープが空か判定 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* ヒープの先頭要素にアクセスする */
    func peek() -> Int {
        maxHeap[0]
    }

    /* ヒープに要素を挿入する */
    func push(val: Int) {
        // ノードを追加する
        maxHeap.append(val)
        // 下から上へヒープ化する
        siftUp(i: size() - 1)
    }

    /* ノード i から上向きにヒープ化する */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // ノード i の親ノードを取得する
            let p = parent(i: i)
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: p)
            // 上向きのヒープ化を繰り返す
            i = p
        }
    }

    /* ヒープから要素を取り出す */
    func pop() -> Int {
        // 空かどうかを確認する
        if isEmpty() {
            fatalError("ヒープが空です")
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(i: 0, j: size() - 1)
        // ノードを削除する
        let val = maxHeap.remove(at: size() - 1)
        // 上から下へヒープ化する
        siftDown(i: 0)
        // ヒープの先頭要素を返す
        return val
    }

    /* ノード i から下向きにヒープ化する */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if ma == i {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: ma)
            // 下向きのヒープ化を繰り返す
            i = ma
        }
    }

    /* ヒープ（二分木）を表示する */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* 実行用コード */
    static func main() {
        /* 最大ヒープを初期化する */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nリストを入力してヒープを構築した後")
        maxHeap.print()

        /* ヒープの先頭要素を取得する */
        var peek = maxHeap.peek()
        print("\nヒープの先頭要素は \(peek)")

        /* ヒープに要素を挿入する */
        let val = 7
        maxHeap.push(val: val)
        print("\n要素 \(val) をヒープに挿入した後")
        maxHeap.print()

        /* ヒープの先頭要素を取り出す */
        peek = maxHeap.pop()
        print("\nヒープの先頭要素 \(peek) を取り出した後")
        maxHeap.print()

        /* ヒープのサイズを取得する */
        let size = maxHeap.size()
        print("\nヒープの要素数は \(size)")

        /* ヒープが空か判定 */
        let isEmpty = maxHeap.isEmpty()
        print("\nヒープは空か \(isEmpty)")
    }
}
