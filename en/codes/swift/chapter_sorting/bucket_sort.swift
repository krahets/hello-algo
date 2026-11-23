/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Bucket sort */
func bucketSort(nums: inout [Double]) {
    // Initialize k = n/2 buckets, expecting 2 elements per bucket
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Distribute the array elements among the buckets
    for num in nums {
        // The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
        let i = Int(num * Double(k))
        // Add num to bucket i
        buckets[i].append(num)
    }
    // 2. Sort each bucket
    for i in buckets.indices {
        // Use the built-in sorting function, or replace it with another sorting algorithm
        buckets[i].sort()
    }
    // 3. Traverse the buckets to combine the results
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
    /* Driver code */
    static func main() {
        // Assume the input consists of floating-point numbers in [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("After bucket sort, nums = \(nums)")
    }
}
