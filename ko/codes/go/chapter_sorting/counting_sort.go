// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* 계수 정렬 */
// 간단한 구현이며, 객체 정렬에는 사용할 수 없다
func countingSortNaive(nums []int) {
	// 1. 배열의 최댓값 m을 구한다
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 각 숫자의 등장 횟수를 센다
	// counter[num]은 num의 등장 횟수를 나타낸다
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* 계수 정렬 */
// 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
func countingSort(nums []int) {
	// 1. 배열의 최댓값 m을 구한다
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 각 숫자의 등장 횟수를 센다
	// counter[num]은 num의 등장 횟수를 나타낸다
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
	// 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
	// 결과를 기록할 배열 res를 초기화한다
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// num을 해당 인덱스에 배치한다
		res[counter[num]-1] = num
		// 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
		counter[num]--
	}
	// 결과 배열 res로 원래 배열 nums를 덮어쓴다
	copy(nums, res)
}
