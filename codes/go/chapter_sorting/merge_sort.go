// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 合并左子数组和右子数组 */
// 左子数组区间 [left, mid]
// 右子数组区间 [mid + 1, right]
func merge(nums []int, left, mid, right int) {
	// 初始化辅助数组 借助 copy 模块
	tmp := make([]int, right-left+1)
	for i := left; i <= right; i++ {
		tmp[i-left] = nums[i]
	}
	// 左子数组的起始索引和结束索引
	leftStart, leftEnd := left-left, mid-left
	// 右子数组的起始索引和结束索引
	rightStart, rightEnd := mid+1-left, right-left
	// i, j 分别指向左子数组、右子数组的首元素
	i, j := leftStart, rightStart
	// 通过覆盖原数组 nums 来合并左子数组和右子数组
	for k := left; k <= right; k++ {
		// 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
		if i > leftEnd {
			nums[k] = tmp[j]
			j++
			// 否则，若“右子数组已全部合并完”或“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
		} else if j > rightEnd || tmp[i] <= tmp[j] {
			nums[k] = tmp[i]
			i++
			// 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
		} else {
			nums[k] = tmp[j]
			j++
		}
	}
}

/* 归并排序 */
func mergeSort(nums []int, left, right int) {
	// 终止条件
	if left >= right {
		return
	}
	// 划分阶段
	mid := (left + right) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// 合并阶段
	merge(nums, left, mid, right)
}
