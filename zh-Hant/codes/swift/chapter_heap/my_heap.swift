/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 大顶堆 */
class MaxHeap {
    private var maxHeap: [Int]

    /* 构造方法，根据输入列表建堆 */
    init(nums: [Int]) {
        // 将列表元素原封不动添加进堆
        maxHeap = nums
        // 堆化除叶节点以外的其他所有节点
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 获取左子节点的索引 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 获取右子节点的索引 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 获取父节点的索引 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 向下整除
    }

    /* 交换元素 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* 获取堆大小 */
    func size() -> Int {
        maxHeap.count
    }

    /* 判断堆是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 访问堆顶元素 */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 元素入堆 */
    func push(val: Int) {
        // 添加节点
        maxHeap.append(val)
        // 从底至顶堆化
        siftUp(i: size() - 1)
    }

    /* 从节点 i 开始，从底至顶堆化 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // 获取节点 i 的父节点
            let p = parent(i: i)
            // 当“越过根节点”或“节点无须修复”时，结束堆化
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 交换两节点
            swap(i: i, j: p)
            // 循环向上堆化
            i = p
        }
    }

    /* 元素出堆 */
    func pop() -> Int {
        // 判空处理
        if isEmpty() {
            fatalError("堆为空")
        }
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        swap(i: 0, j: size() - 1)
        // 删除节点
        let val = maxHeap.remove(at: size() - 1)
        // 从顶至底堆化
        siftDown(i: 0)
        // 返回堆顶元素
        return val
    }

    /* 从节点 i 开始，从顶至底堆化 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if ma == i {
                break
            }
            // 交换两节点
            swap(i: i, j: ma)
            // 循环向下堆化
            i = ma
        }
    }

    /* 打印堆（二叉树） */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* 初始化大顶堆 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n输入列表并建堆后")
        maxHeap.print()

        /* 获取堆顶元素 */
        var peek = maxHeap.peek()
        print("\n堆顶元素为 \(peek)")

        /* 元素入堆 */
        let val = 7
        maxHeap.push(val: val)
        print("\n元素 \(val) 入堆后")
        maxHeap.print()

        /* 堆顶元素出堆 */
        peek = maxHeap.pop()
        print("\n堆顶元素 \(peek) 出堆后")
        maxHeap.print()

        /* 获取堆大小 */
        let size = maxHeap.size()
        print("\n堆元素数量为 \(size)")

        /* 判断堆是否为空 */
        let isEmpty = maxHeap.isEmpty()
        print("\n堆是否为空 \(isEmpty)")
    }
}
