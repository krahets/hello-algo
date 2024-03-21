/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // 判断节点 i, l, r 中值最大的节点，记为 ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
        if ma == i {
            break
        }
        // 交换两节点
        nums.swapAt(i, ma)
        // 循环向下堆化
        i = ma
    }
}

/* 堆排序 */
func heapSort(nums: inout [Int]) {
    // 建堆操作：堆化除叶节点以外的其他所有节点
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // 从堆中提取最大元素，循环 n-1 轮
    for i in nums.indices.dropFirst().reversed() {
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        nums.swapAt(0, i)
        // 以根节点为起点，从顶至底进行堆化
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("堆排序完成后 nums = \(nums)")
    }
}
