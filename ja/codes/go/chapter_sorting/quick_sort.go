// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// クイックソート
type quickSort struct{}

// クイックソート（中央値の基準値で最適化）
type quickSortMedian struct{}

// クイックソート（再帰深度最適化）
type quickSortTailCall struct{}

/* 番兵分割 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// nums[left] を基準値とする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ基準値未満の最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ基準値より大きい最初の要素を探す
		}
		// 要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 基準値を 2 つの部分配列の境界へ交換する
	nums[i], nums[left] = nums[left], nums[i]
	return i // 基準値のインデックスを返す
}

/* クイックソート */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 なら再帰を終了する
	if left >= right {
		return
	}
	// 番兵分割
	pivot := q.partition(nums, left, right)
	// 左右の部分配列を再帰処理
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 3つの候補要素の中央値を選ぶ */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m は l と r の間
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l は m と r の間
	}
	return right
}

/* 番兵による分割処理（3 点中央値） */
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// nums[left] を基準値とする
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 中央値を配列の最左端に交換する
	nums[left], nums[med] = nums[med], nums[left]
	// nums[left] を基準値とする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ基準値未満の最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ基準値より大きい最初の要素を探す
		}
		// 要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 基準値を 2 つの部分配列の境界へ交換する
	nums[i], nums[left] = nums[left], nums[i]
	return i // 基準値のインデックスを返す
}

/* クイックソート */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 なら再帰を終了する
	if left >= right {
		return
	}
	// 番兵分割
	pivot := q.partition(nums, left, right)
	// 左右の部分配列を再帰処理
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 番兵分割 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// nums[left] を基準値とする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ基準値未満の最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ基準値より大きい最初の要素を探す
		}
		// 要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 基準値を 2 つの部分配列の境界へ交換する
	nums[i], nums[left] = nums[left], nums[i]
	return i // 基準値のインデックスを返す
}

/* クイックソート（再帰深度最適化） */
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 なら終了
	for left < right {
		// 番兵による分割処理
		pivot := q.partition(nums, left, right)
		// 2 つの部分配列のうち短いほうにクイックソートを適用する
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 左部分配列を再帰的にソート
			left = pivot + 1                 // 未ソート区間の残りは [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 右部分配列を再帰的にソート
			right = pivot - 1                 // 未ソート区間の残りは [left, pivot - 1]
		}
	}
}
