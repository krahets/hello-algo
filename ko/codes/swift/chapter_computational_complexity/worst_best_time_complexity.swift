/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
func randomNumbers(n: Int) -> [Int] {
    // 배열 nums = { 1, 2, 3, ..., n }을 만든다
    var nums = Array(1 ... n)
    // 배열의 원소를 무작위로 섞는다
    nums.shuffle()
    return nums
}

/* 배열 nums에서 1의 인덱스를 찾는다 */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
        // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* 실행 예제 */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("배열 [ 1, 2, ..., n ]을 섞은 결과 = \(nums)")
            print("숫자 1의 인덱스 = \(index)")
        }
    }
}
