// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* 定数階 */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* 線形階 */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 線形時間（配列を走査） */
func arrayTraversal(nums []int) int {
	count := 0
	// ループ回数は配列長に比例する
	for range nums {
		count++
	}
	return count
}

/* 二乗階 */
func quadratic(n int) int {
	count := 0
	// ループ回数はデータサイズ n の二乗に比例する
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* 二次時間（バブルソート） */
func bubbleSort(nums []int) int {
	count := 0 // カウンタ
	// 外側のループ：未ソート区間は [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j] と nums[j + 1] を交換
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // 要素交換には 3 回の単位操作が含まれる
			}
		}
	}
	return count
}

/* 指数時間（ループ実装） */
func exponential(n int) int {
	count, base := 0, 1
	// 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* 指数時間（再帰実装） */
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* 対数時間（ループ実装） */
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* 対数時間（再帰実装） */
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* 線形対数時間 */
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

/* 階乗時間（再帰実装） */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// 1個から n 個に分裂
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
