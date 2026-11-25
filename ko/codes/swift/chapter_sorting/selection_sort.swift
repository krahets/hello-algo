/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 선택 정렬 */
func selectionSort(nums: inout [Int]) {
    // 바깥 루프: 미정렬 구간은 [i, n-1]
    for i in nums.indices.dropLast() {
        // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 최솟값의 인덱스 기록
            }
        }
        // 최솟값과 미정렬 구간의 첫 원소 교환
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* 실행 예제 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("선택 정렬 후 nums = \(nums)")
    }
}
