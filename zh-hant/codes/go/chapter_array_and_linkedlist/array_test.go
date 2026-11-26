// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
這裡將 Go 的切片（Slice）視為陣列（Array）。這樣較容易理解，
也有助於我們專注在資料結構與演算法上。
*/

import (
	"fmt"
	"testing"
)

/* 範例主程式 */
func TestArray(t *testing.T) {
	/* 初始化陣列 */
	var arr [5]int
	fmt.Println("陣列 arr =", arr)
	// 在 Go 中，指定長度時（[5]int）是陣列，未指定長度時（[]int）是切片
	// Go 陣列的長度必須在編譯時確定，因此只能用常數指定長度
	// 為了方便實作擴充容量的 extend() 函式，以下將切片（Slice）視為陣列（Array）
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("陣列 nums =", nums)

	/* 隨機存取 */
	randomNum := randomAccess(nums)
	fmt.Println("從 nums 隨機取得的元素為", randomNum)

	/* 增加長度 */
	nums = extend(nums, 3)
	fmt.Println("將陣列長度增加至 8，得到 nums =", nums)

	/* 插入元素 */
	insert(nums, 6, 3)
	fmt.Println("在索引 3 處插入數字 6，得到 nums =", nums)

	/* 刪除元素 */
	remove(nums, 2)
	fmt.Println("刪除索引 2 處的元素，得到 nums =", nums)

	/* 走訪陣列 */
	traverse(nums)

	/* 尋找元素 */
	index := find(nums, 3)
	fmt.Println("在 nums 中尋找元素 3，得到索引 =", index)
}
