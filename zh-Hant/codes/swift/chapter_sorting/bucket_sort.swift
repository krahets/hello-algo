/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 桶排序 */
func bucketSort(nums: inout [Double]) {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. 將陣列元素分配到各個桶中
    for num in nums {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        let i = Int(num * Double(k))
        // 將 num 新增進桶 i
        buckets[i].append(num)
    }
    // 2. 對各個桶執行排序
    for i in buckets.indices {
        // 使用內建排序函式，也可以替換成其他排序演算法
        buckets[i].sort()
    }
    // 3. 走訪桶合併結果
    var i = nums.startIndex
    for bucket in buckets {
        for num in bucket {
            nums[i] = num
            i += 1
        }
    }
}

@main
enum BucketSort {
    /* Driver Code */
    static func main() {
        // 設輸入資料為浮點數，範圍為 [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("桶排序完成後 nums = \(nums)")
    }
}
