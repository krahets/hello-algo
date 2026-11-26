/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 最大ヒープ */
class MaxHeap {
    private var maxHeap: [Int]

    /* 入力リストからヒープを構築するコンストラクタ */
    init(nums: [Int]) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums
        // 葉以外のすべてのノードをヒープ化する
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 左の子のインデックスを取得する */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 右の子のインデックスを取得する */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 親のインデックスを取得する */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 商を 0 方向に丸める
    }

    /* 要素を交換する */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* ヒープのサイズを取得する */
    func size() -> Int {
        maxHeap.count
    }

    /* ヒープが空か判定する */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* ヒープの根の要素を参照する */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 要素をヒープに挿入する */
    func push(val: Int) {
        // ノードを追加する
        maxHeap.append(val)
        // 上に向かってヒープ化する
        siftUp(i: size() - 1)
    }

    /* ノード i から上に向かってヒープ化する */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // ノード i の親を取得する
            let p = parent(i: i)
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: p)
            // 上へのヒープ化を繰り返す
            i = p
        }
    }

    /* 根の要素をヒープから取り出す */
    func pop() -> Int {
        // 空の場合の処理
        if isEmpty() {
            fatalError("ヒープが空です")
        }
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        swap(i: 0, j: size() - 1)
        // ノードを削除する
        let val = maxHeap.remove(at: size() - 1)
        // 下に向かってヒープ化する
        siftDown(i: 0)
        // 根の要素を返す
        return val
    }

    /* ノード i から下に向かってヒープ化する */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // ノード i、l、r のうち値が最大のものを ma とする
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if ma == i {
                break
            }
            // 2 つのノードを交換する
            swap(i: i, j: ma)
            // 下へのヒープ化を繰り返す
            i = ma
        }
    }

    /* ヒープを二分木として表示する */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* 実行例 */
    static func main() {
        /* 最大ヒープを初期化する */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n入力リストから構築したヒープ：")
        maxHeap.print()

        /* ヒープの根の要素を取得する */
        var peek = maxHeap.peek()
        print("\nヒープの根の要素：\(peek)")

        /* 要素をヒープに挿入する */
        let val = 7
        maxHeap.push(val: val)
        print("\n要素 \(val) の挿入後：")
        maxHeap.print()

        /* 根の要素を取り出す */
        peek = maxHeap.pop()
        print("\n根の要素 \(peek) を取り出した後：")
        maxHeap.print()

        /* ヒープのサイズを取得する */
        let size = maxHeap.size()
        print("\nヒープの要素数：\(size)")

        /* ヒープが空か判定する */
        let isEmpty = maxHeap.isEmpty()
        print("\nヒープは空か：\(isEmpty)")
    }
}
