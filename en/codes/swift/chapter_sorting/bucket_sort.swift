/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Bucket sort */
func bucketSort(nums: inout [Double]) {
    // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Distribute array elements into various buckets
    for num in nums {
        // Input data range is [0, 1), use num * k to map to index range [0, k-1]
        let i = Int(num * Double(k))
        // Add num to bucket i
        buckets[i].append(num)
    }
    // 2. Sort each bucket
    for i in buckets.indices {
        // Use built-in sorting function, can also replace with other sorting algorithms
        buckets[i].sort()
    }
    // 3. Traverse buckets to merge results
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
        // Assume input data is floating point, interval [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("After bucket sort, nums = \(nums)")
    }
}
