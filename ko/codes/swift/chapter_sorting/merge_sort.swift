/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
    // 병합 결과를 저장할 임시 배열 tmp를 생성한다
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
    var i = left, j = mid + 1, k = 0
    // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* 병합 정렬 */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 종료 조건
    if left >= right { // 부분 배열의 길이가 1이면 재귀를 종료한다
        return
    }
    // 분할 단계
    let mid = left + (right - left) / 2 // 중간 위치를 계산한다
    mergeSort(nums: &nums, left: left, right: mid) // 왼쪽 부분 배열에 재귀 호출한다
    mergeSort(nums: &nums, left: mid + 1, right: right) // 오른쪽 부분 배열에 재귀 호출한다
    // 병합 단계
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* 실행 코드 */
    static func main() {
        /* 병합 정렬 */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("병합 정렬 후 nums = \(nums)")
    }
}
