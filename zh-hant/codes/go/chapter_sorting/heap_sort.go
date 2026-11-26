// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 堆積的長度為 n，從節點 i 開始由上而下調整堆積 */
func siftDown(nums *[]int, n, i int) {
	for true {
		// 找出節點 i、l、r 中值最大的節點，記為 ma
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
		if ma == i {
			break
		}
		// 交換兩個節點
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// 以迴圈繼續向下調整堆積
		i = ma
	}
}

/* 堆積排序 */
func heapSort(nums *[]int) {
	// 建立堆積：對所有非葉節點執行堆積調整
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// 從堆積中取出最大元素，重複 n-1 輪
	for i := len(*nums) - 1; i > 0; i-- {
		// 交換根節點與最右側的葉節點（即交換首尾元素）
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// 從根節點開始，由上而下調整堆積
		siftDown(nums, i, 0)
	}
}
