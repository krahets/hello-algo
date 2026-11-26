/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 삽입 정렬 */
func insertionSort(nums: inout [Int]) {
    // 바깥 루프: 정렬된 구간은 [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // nums[j]를 오른쪽으로 한 칸 이동
            j -= 1
        }
        nums[j + 1] = base // 올바른 위치에 base 대입
    }
}

@main
enum InsertionSort {
    /* 실행 예제 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("삽입 정렬 후 nums = \(nums)")
    }
}
