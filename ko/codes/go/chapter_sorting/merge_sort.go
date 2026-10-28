// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
func merge(nums []int, left, mid, right int) {
	// 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
	// 병합 결과를 저장할 임시 배열 tmp를 생성한다
	tmp := make([]int, right-left+1)
	// 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
	i, j, k := left, mid+1, 0
	// 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
	for i <= mid && j <= right {
		if nums[i] <= nums[j] {
			tmp[k] = nums[i]
			i++
		} else {
			tmp[k] = nums[j]
			j++
		}
		k++
	}
	// 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
	for i <= mid {
		tmp[k] = nums[i]
		i++
		k++
	}
	for j <= right {
		tmp[k] = nums[j]
		j++
		k++
	}
	// 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* 병합 정렬 */
func mergeSort(nums []int, left, right int) {
	// 종료 조건
	if left >= right {
		return
	}
	// 분할 단계
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// 병합 단계
	merge(nums, left, mid, right)
}
