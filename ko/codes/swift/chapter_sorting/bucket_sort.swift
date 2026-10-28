/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 버킷 정렬 */
func bucketSort(nums: inout [Double]) {
    // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. 배열 원소를 각 버킷에 배정한다
    for num in nums {
        // 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
        let i = Int(num * Double(k))
        // num을 버킷 i에 추가한다
        buckets[i].append(num)
    }
    // 2. 각 버킷을 정렬한다
    for i in buckets.indices {
        // 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
        buckets[i].sort()
    }
    // 3. 버킷을 순회하여 결과를 합친다
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
    /* 실행 코드 */
    static func main() {
        // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("버킷 정렬 후 nums = \(nums)")
    }
}
