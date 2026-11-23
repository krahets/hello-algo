// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// クイックソート
type quickSort struct{}

// クイックソート（中央値ピボットによる最適化）
type quickSortMedian struct{}

// クイックソート（再帰の深さの最適化）
type quickSortTailCall struct{}

/* 番兵を用いた分割 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ、ピボットより大きい最初の要素を探す
		}
		// 要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// ピボットを 2 つの部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i // ピボットのインデックスを返す
}

/* クイックソート */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら再帰を終了する
	if left >= right {
		return
	}
	// 番兵を用いた分割
	pivot := q.partition(nums, left, right)
	// 左部分配列と右部分配列を再帰的に処理する
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 候補となる 3 要素の中央値を選ぶ */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m が l と r の間にある
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l が m と r の間にある
	}
	return right
}

/* 番兵を用いた分割（3 値の中央値を選択）*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 中央値を配列の左端に移す
	nums[left], nums[med] = nums[med], nums[left]
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //右から左へ、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ //左から右へ、ピボットより大きい最初の要素を探す
		}
		//要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	//ピボットを 2 つの部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i //ピボットのインデックスを返す
}

/* クイックソート */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら再帰を終了する
	if left >= right {
		return
	}
	// 番兵を用いた分割
	pivot := q.partition(nums, left, right)
	// 左部分配列と右部分配列を再帰的に処理する
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 番兵を用いた分割 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// nums[left] をピボットとする
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 右から左へ、ピボットより小さい最初の要素を探す
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 左から右へ、ピボットより大きい最初の要素を探す
		}
		// 要素の交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// ピボットを 2 つの部分配列の境界に移す
	nums[i], nums[left] = nums[left], nums[i]
	return i // ピボットのインデックスを返す
}

/* クイックソート（再帰の深さの最適化）*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 部分配列の長さが 1 になったら終了する
	for left < right {
		// 番兵を用いた分割操作
		pivot := q.partition(nums, left, right)
		// 2 つの部分配列のうち短いほうにクイックソートを適用する
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 左部分配列を再帰的にソートする
			left = pivot + 1                 // 残りの未ソート区間は [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 右部分配列を再帰的にソートする
			right = pivot - 1                 // 残りの未ソート区間は [left, pivot - 1]
		}
	}
}
