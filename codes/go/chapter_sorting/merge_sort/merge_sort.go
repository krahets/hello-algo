package merge_sort
// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

/*
	合并左子数组和右子数组
	左子数组区间 [left, mid]
	右子数组区间 [mid + 1, right]
*/
func merge(nums []int, left, mid, right int) {
	// 初始化辅助数组 借助 copy模块
	tmp := make([]int, right-left+1)
	for i := left; i <= right; i++ {
		tmp[i-left] = nums[i]
	}
	// 左子数组的起始索引和结束索引
	left_start, left_end := left-left, mid-left
	// 右子数组的起始索引和结束索引
	right_start, right_end := mid+1-left, right-left
	// i, j 分别指向左子数组、右子数组的首元素
	i, j := left_start, right_start
	// 通过覆盖原数组 nums 来合并左子数组和右子数组
	for k := left; k <= right; k++ {
		// 若 “左子数组已全部合并完”，则选取右子数组元素，并且 j++
		if i > left_end {
			nums[k] = tmp[j]
			j++
		// 否则，若 “右子数组已全部合并完” 或 “左子数组元素 < 右子数组元素”，则选取左子数组元素，并且 i++
		} else if j > right_end || tmp[i] <= tmp[j] {
			nums[k] = tmp[i]
			i++
		// 否则，若 “左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
		} else {
			nums[k] = tmp[j]
			j++
		}
	}
}


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