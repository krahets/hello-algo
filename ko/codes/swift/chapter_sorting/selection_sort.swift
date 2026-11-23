/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 선택 정렬 */
func selectionSort(nums: inout [Int]) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for i in nums.indices.dropLast() {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 최솟값의 인덱스를 기록한다
            }
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* 실행 코드 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("선택 정렬 후 nums = \(nums)")
    }
}
