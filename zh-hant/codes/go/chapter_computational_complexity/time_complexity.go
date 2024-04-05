// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* 常數階 */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* 線性階 */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 線性階（走訪陣列） */
func arrayTraversal(nums []int) int {
	count := 0
	// 迴圈次數與陣列長度成正比
	for range nums {
		count++
	}
	return count
}

/* 平方階 */
func quadratic(n int) int {
	count := 0
	// 迴圈次數與資料大小 n 成平方關係
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* 平方階（泡沫排序） */
func bubbleSort(nums []int) int {
	count := 0 // 計數器
	// 外迴圈：未排序區間為 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交換 nums[j] 與 nums[j + 1]
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // 元素交換包含 3 個單元操作
			}
		}
	}
	return count
}

/* 指數階（迴圈實現）*/
func exponential(n int) int {
	count, base := 0, 1
	// 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* 指數階（遞迴實現）*/
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* 對數階（迴圈實現）*/
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* 對數階（遞迴實現）*/
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* 線性對數階 */
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

/* 階乘階（遞迴實現） */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// 從 1 個分裂出 n 個
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
