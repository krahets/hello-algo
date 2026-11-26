// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// クイックソート
type quickSort struct{}

// クイックソート（中央値をピボットに使用）
type quickSortMedian struct{}

// クイックソート（再帰の深さを最適化）
type quickSortTailCall struct{}

/* 左右から走査して分割 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ走査し、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ走査し、ピボットより大きい最初の要素を探す
		}
		// 要素を交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// ピボットを交換して左右の部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i // ピボットのインデックスを返す
}

/* クイックソート */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら再帰を終了
	if left >= right {
		return
	}
	// 左右から走査して分割
	pivot := q.partition(nums, left, right)
	// 左右の部分配列を再帰的に処理
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 3 つの候補の中央値を選ぶ */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m の値は l と r の値の間にある
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l の値は m と r の値の間にある
	}
	return right
}

/* 左右から走査して分割（3 要素の中央値を使用）*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 中央値の要素を配列の左端に移す
	nums[left], nums[med] = nums[med], nums[left]
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //右から左へ走査し、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ //左から右へ走査し、ピボットより大きい最初の要素を探す
		}
		//要素を交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	//ピボットを交換して左右の部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i //ピボットのインデックスを返す
}

/* クイックソート */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら再帰を終了
	if left >= right {
		return
	}
	// 左右から走査して分割
	pivot := q.partition(nums, left, right)
	// 左右の部分配列を再帰的に処理
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 左右から走査して分割 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ走査し、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ走査し、ピボットより大きい最初の要素を探す
		}
		// 要素を交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// ピボットを交換して左右の部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i // ピボットのインデックスを返す
}

/* クイックソート（再帰の深さを最適化）*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら終了
	for left < right {
		// 左右から走査して分割
		pivot := q.partition(nums, left, right)
		// 短いほうの部分配列にクイックソートを適用
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 左の部分配列を再帰的にソート
			left = pivot + 1                 // 残りの未整列区間は [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 右の部分配列を再帰的にソート
			right = pivot - 1                 // 残りの未整列区間は [left, pivot - 1]
		}
	}
}
