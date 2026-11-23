// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* 定数オーダー */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* 線形オーダー */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 線形オーダー（配列の走査） */
func arrayTraversal(nums []int) int {
	count := 0
	// ループの回数は配列の長さに比例する
	for range nums {
		count++
	}
	return count
}

/* 二次オーダー */
func quadratic(n int) int {
	count := 0
	// ループの回数はデータの大きさ n の二乗に比例する
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* 二次オーダー（バブルソート） */
func bubbleSort(nums []int) int {
	count := 0 // カウンタ
	// 外側のループ：未ソート区間は [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j] と nums[j + 1] を交換する
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // 要素の交換は 3 回の単位操作からなる
			}
		}
	}
	return count
}

/* 指数オーダー（ループによる実装）*/
func exponential(n int) int {
	count, base := 0, 1
	// 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* 指数オーダー（再帰による実装）*/
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* 対数オーダー（ループによる実装）*/
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* 対数オーダー（再帰による実装）*/
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* 線形対数オーダー */
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

/* 階乗オーダー（再帰による実装） */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// 1 個から n 個に分裂する
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
