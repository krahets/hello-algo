// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
func siftDown(nums *[]int, n, i int) {
	for true {
		// 判断节点 i, l, r 中值最大的节点，记为 ma
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
		if ma == i {
			break
		}
		// 交换两节点
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// 循环向下堆化
		i = ma
	}
}

/* 堆排序 */
func heapSort(nums *[]int) {
	// 建堆操作：堆化除叶节点以外的其他所有节点
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// 从堆中提取最大元素，循环 n-1 轮
	for i := len(*nums) - 1; i > 0; i-- {
		// 交换根节点与最右叶节点（交换首元素与尾元素）
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// 以根节点为起点，从顶至底进行堆化
		siftDown(nums, i, 0)
	}
}
