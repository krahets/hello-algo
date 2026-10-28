// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* 상수 차수 */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* 선형 차수 */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 선형 차수(배열 순회) */
func arrayTraversal(nums []int) int {
	count := 0
	// 반복 횟수는 배열 길이에 비례한다
	for range nums {
		count++
	}
	return count
}

/* 제곱 차수 */
func quadratic(n int) int {
	count := 0
	// 반복 횟수는 데이터 크기 n의 제곱에 비례한다
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* 제곱 차수(버블 정렬) */
func bubbleSort(nums []int) int {
	count := 0 // 카운터
	// 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
	for i := len(nums) - 1; i > 0; i-- {
		// 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j]와 nums[j + 1]을 교환한다
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // 원소 교환에는 단위 연산 3회가 포함된다
			}
		}
	}
	return count
}

/* 지수 차수(반복문 구현)*/
func exponential(n int) int {
	count, base := 0, 1
	// 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* 지수 차수(재귀 구현)*/
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* 로그 차수(반복문 구현)*/
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* 로그 차수(재귀 구현)*/
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* 선형 로그 차수 */
func linearLogRecur(n int) int {
	if n <= 1 {
		return 1
	}
	count := linearLogRecur(n/2) + linearLogRecur(n/2)
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 팩토리얼 차수(재귀 구현) */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// 하나에서 n개로 분열한다
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
