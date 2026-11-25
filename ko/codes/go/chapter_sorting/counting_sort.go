// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* 계수 정렬 */
// 객체를 정렬할 수 없는 간단한 구현
func countingSortNaive(nums []int) {
	// 1. 배열의 최댓값 m 구하기
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 각 숫자의 출현 횟수 세기
	// counter[num]은 num의 출현 횟수
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* 계수 정렬 */
// 객체도 정렬할 수 있는 안정 정렬의 전체 구현
func countingSort(nums []int) {
	// 1. 배열의 최댓값 m 구하기
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 각 숫자의 출현 횟수 세기
	// counter[num]은 num의 출현 횟수
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
	// 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
	// 결과를 기록할 배열 res 초기화
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// num을 해당 인덱스에 배치
		res[counter[num]-1] = num
		// 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
		counter[num]--
	}
	// 결과 배열 res로 원래 배열 nums를 덮어쓰기
	copy(nums, res)
}
