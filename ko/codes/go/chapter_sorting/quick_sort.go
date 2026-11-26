// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// 퀵 정렬
type quickSort struct{}

// 퀵 정렬(중앙값 피벗 최적화)
type quickSortMedian struct{}

// 퀵 정렬(재귀 깊이 최적화)
type quickSortTailCall struct{}

/* 양방향 포인터로 분할 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// nums[left]를 피벗으로 선택
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
		}
		// 원소 교환
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 교환을 통해 피벗을 두 부분 배열의 경계에 배치
	nums[i], nums[left] = nums[left], nums[i]
	return i // 피벗의 인덱스 반환
}

/* 퀵 정렬 */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 부분 배열의 길이가 1이면 재귀 종료
	if left >= right {
		return
	}
	// 양방향 포인터로 분할
	pivot := q.partition(nums, left, right)
	// 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 세 후보 원소의 중앙값 선택 */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m이 l과 r 사이에 있음
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l이 m과 r 사이에 있음
	}
	return right
}

/* 양방향 포인터로 분할(세 값의 중앙값 선택)*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// nums[left]를 피벗으로 선택
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
	nums[left], nums[med] = nums[med], nums[left]
	// nums[left]를 피벗으로 선택
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
		}
		for i < j && nums[i] <= nums[left] {
			i++ //왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
		}
		//원소 교환
		nums[i], nums[j] = nums[j], nums[i]
	}
	//교환을 통해 피벗을 두 부분 배열의 경계에 배치
	nums[i], nums[left] = nums[left], nums[i]
	return i //피벗의 인덱스 반환
}

/* 퀵 정렬 */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 부분 배열의 길이가 1이면 재귀 종료
	if left >= right {
		return
	}
	// 양방향 포인터로 분할
	pivot := q.partition(nums, left, right)
	// 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 양방향 포인터로 분할 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// nums[left]를 피벗으로 선택
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
		}
		// 원소 교환
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 교환을 통해 피벗을 두 부분 배열의 경계에 배치
	nums[i], nums[left] = nums[left], nums[i]
	return i // 피벗의 인덱스 반환
}

/* 퀵 정렬(재귀 깊이 최적화)*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 부분 배열의 길이가 1이면 종료
	for left < right {
		// 양방향 포인터로 분할
		pivot := q.partition(nums, left, right)
		// 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 왼쪽 부분 배열 재귀 정렬
			left = pivot + 1                 // 남은 미정렬 구간은 [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 오른쪽 부분 배열 재귀 정렬
			right = pivot - 1                 // 남은 미정렬 구간은 [left, pivot - 1]
		}
	}
}
