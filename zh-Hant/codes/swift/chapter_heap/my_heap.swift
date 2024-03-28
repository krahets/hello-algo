/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 大頂堆積 */
class MaxHeap {
    private var maxHeap: [Int]

    /* 建構子，根據輸入串列建堆積 */
    init(nums: [Int]) {
        // 將串列元素原封不動新增進堆積
        maxHeap = nums
        // 堆積化除葉節點以外的其他所有節點
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 獲取左子節點的索引 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 獲取右子節點的索引 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 獲取父節點的索引 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 向下整除
    }

    /* 交換元素 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* 獲取堆積大小 */
    func size() -> Int {
        maxHeap.count
    }

    /* 判斷堆積是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 訪問堆積頂元素 */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 元素入堆積 */
    func push(val: Int) {
        // 新增節點
        maxHeap.append(val)
        // 從底至頂堆積化
        siftUp(i: size() - 1)
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // 獲取節點 i 的父節點
            let p = parent(i: i)
            // 當“越過根節點”或“節點無須修復”時，結束堆積化
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 交換兩節點
            swap(i: i, j: p)
            // 迴圈向上堆積化
            i = p
        }
    }

    /* 元素出堆積 */
    func pop() -> Int {
        // 判空處理
        if isEmpty() {
            fatalError("堆積為空")
        }
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        swap(i: 0, j: size() - 1)
        // 刪除節點
        let val = maxHeap.remove(at: size() - 1)
        // 從頂至底堆積化
        siftDown(i: 0)
        // 返回堆積頂元素
        return val
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if ma == i {
                break
            }
            // 交換兩節點
            swap(i: i, j: ma)
            // 迴圈向下堆積化
            i = ma
        }
    }

    /* 列印堆積（二元樹） */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* 初始化大頂堆積 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n輸入串列並建堆積後")
        maxHeap.print()

        /* 獲取堆積頂元素 */
        var peek = maxHeap.peek()
        print("\n堆積頂元素為 \(peek)")

        /* 元素入堆積 */
        let val = 7
        maxHeap.push(val: val)
        print("\n元素 \(val) 入堆積後")
        maxHeap.print()

        /* 堆積頂元素出堆積 */
        peek = maxHeap.pop()
        print("\n堆積頂元素 \(peek) 出堆積後")
        maxHeap.print()

        /* 獲取堆積大小 */
        let size = maxHeap.size()
        print("\n堆積元素數量為 \(size)")

        /* 判斷堆積是否為空 */
        let isEmpty = maxHeap.isEmpty()
        print("\n堆積是否為空 \(isEmpty)")
    }
}
