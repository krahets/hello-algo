/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 이진 탐색: 문제 f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
    if i > j {
        return -1
    }
    // 중간 인덱스 m을 계산한다
    let m = (i + j) / 2
    if nums[m] < target {
        // 부분 문제 f(m+1, j)를 재귀적으로 푼다
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // 부분 문제 f(i, m-1)를 재귀적으로 푼다
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return m
    }
}

/* 이진 탐색 */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 문제 f(0, n-1)을 푼다
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* 실행 코드 */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // 이진 탐색(양 끝을 포함하는 닫힌 구간)
        let index = binarySearch(nums: nums, target: target)
        print("목표 원소 6의 인덱스 = \(index)")
    }
}
