/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 이진 탐색으로 가장 왼쪽의 target 찾기 */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // target의 삽입 위치를 찾는 것과 같다.
    let i = binarySearchInsertion(nums: nums, target: target)
    // target을 찾지 못했으므로 -1을 반환한다.
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // target을 찾았으므로 인덱스 i를 반환한다.
    return i
}

/* 이진 탐색으로 가장 오른쪽의 target 찾기 */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 가장 왼쪽의 target + 1을 찾는 문제로 바꾼다.
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j는 가장 오른쪽의 target을, i는 target보다 큰 첫 원소를 가리킨다.
    let j = i - 1
    // target을 찾지 못했으므로 -1을 반환한다.
    if j == -1 || nums[j] != target {
        return -1
    }
    // target을 찾았으므로 인덱스 j를 반환한다.
    return j
}

@main
enum BinarySearchEdge {
    /* 실행 예제 */
    static func main() {
        // 중복 원소가 있는 배열
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n배열 nums = \(nums)")

        // 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("찾을 값 = \(target) | 첫 인덱스 = \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("찾을 값 = \(target) | 마지막 인덱스 = \(index)")
        }
    }
}
