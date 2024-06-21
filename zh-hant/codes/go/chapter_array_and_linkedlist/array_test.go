// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
我們將 Go 中的 Slice 切片看作 Array 陣列。因為這樣可以
降低理解成本，利於我們將關注點放在資料結構與演算法上。
*/

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* 初始化陣列 */
	var arr [5]int
	fmt.Println("陣列 arr =", arr)
	// 在 Go 中，指定長度時（[5]int）為陣列，不指定長度時（[]int）為切片
	// 由於 Go 的陣列被設計為在編譯期確定長度，因此只能使用常數來指定長度
	// 為了方便實現擴容 extend() 函式，以下將切片（Slice）看作陣列（Array）
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("陣列 nums =", nums)

	/* 隨機訪問 */
	randomNum := randomAccess(nums)
	fmt.Println("在 nums 中獲取隨機元素", randomNum)

	/* 長度擴展 */
	nums = extend(nums, 3)
	fmt.Println("將陣列長度擴展至 8 ，得到 nums =", nums)

	/* 插入元素 */
	insert(nums, 6, 3)
	fmt.Println("在索引 3 處插入數字 6 ，得到 nums =", nums)

	/* 刪除元素 */
	remove(nums, 2)
	fmt.Println("刪除索引 2 處的元素，得到 nums =", nums)

	/* 走訪陣列 */
	traverse(nums)

	/* 查詢元素 */
	index := find(nums, 3)
	fmt.Println("在 nums 中查詢元素 3 ，得到索引 =", index)
}
