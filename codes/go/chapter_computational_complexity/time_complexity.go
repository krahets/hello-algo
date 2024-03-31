// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* 常数阶 */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* 线性阶 */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* 线性阶（遍历数组） */
func arrayTraversal(nums []int) int {
	count := 0
	// 循环次数与数组长度成正比
	for range nums {
		count++
	}
	return count
}

/* 平方阶 */
func quadratic(n int) int {
	count := 0
	// 循环次数与数据大小 n 成平方关系
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* 平方阶（冒泡排序） */
func bubbleSort(nums []int) int {
	count := 0 // 计数器
	// 外循环：未排序区间为 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交换 nums[j] 与 nums[j + 1]
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // 元素交换包含 3 个单元操作
			}
		}
	}
	return count
}

/* 指数阶（循环实现）*/
func exponential(n int) int {
	count, base := 0, 1
	// 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* 指数阶（递归实现）*/
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* 对数阶（循环实现）*/
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* 对数阶（递归实现）*/
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* 线性对数阶 */
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

/* 阶乘阶（递归实现） */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// 从 1 个分裂出 n 个
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
