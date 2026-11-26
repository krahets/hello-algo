/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 最大堆積 */
class MaxHeap {
    private var maxHeap: [Int]

    /* 建構式，根據輸入串列建立堆積 */
    init(nums: [Int]) {
        // 將串列元素依原順序全部加入堆積
        maxHeap = nums
        // 從每個非葉節點向下調整堆積
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 取得左子節點的索引 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 取得右子節點的索引 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 取得父節點的索引 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 向下取整的整數除法
    }

    /* 交換元素 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* 取得堆積大小 */
    func size() -> Int {
        maxHeap.count
    }

    /* 判斷堆積是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 讀取堆積頂端元素 */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 將元素加入堆積 */
    func push(val: Int) {
        // 新增節點
        maxHeap.append(val)
        // 由下往上調整堆積
        siftUp(i: size() - 1)
    }

    /* 從節點 i 開始向上調整堆積 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // 取得節點 i 的父節點
            let p = parent(i: i)
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 交換兩個節點
            swap(i: i, j: p)
            // 繼續向上調整堆積
            i = p
        }
    }

    /* 從堆積取出元素 */
    func pop() -> Int {
        // 檢查堆積是否為空
        if isEmpty() {
            fatalError("堆積為空")
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(i: 0, j: size() - 1)
        // 刪除節點
        let val = maxHeap.remove(at: size() - 1)
        // 由上往下調整堆積
        siftDown(i: 0)
        // 回傳堆積頂端元素
        return val
    }

    /* 從節點 i 開始向下調整堆積 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if ma == i {
                break
            }
            // 交換兩個節點
            swap(i: i, j: ma)
            // 繼續向下調整堆積
            i = ma
        }
    }

    /* 印出堆積（二元樹） */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* 初始化最大堆積 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n用輸入串列建立堆積後")
        maxHeap.print()

        /* 取得堆積頂端元素 */
        var peek = maxHeap.peek()
        print("\n堆積頂端元素為 \(peek)")

        /* 將元素加入堆積 */
        let val = 7
        maxHeap.push(val: val)
        print("\n將元素 \(val) 加入堆積後")
        maxHeap.print()

        /* 取出堆積頂端元素 */
        peek = maxHeap.pop()
        print("\n取出堆積頂端元素 \(peek) 後")
        maxHeap.print()

        /* 取得堆積大小 */
        let size = maxHeap.size()
        print("\n堆積中的元素個數為 \(size)")

        /* 判斷堆積是否為空 */
        let isEmpty = maxHeap.isEmpty()
        print("\n堆積是否為空 \(isEmpty)")
    }
}
