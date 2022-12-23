// File: my_array_test.go
// Created Time: 2022-12-18
// Author: kesq (nosqlcoco@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestMyArray(t *testing.T) {
	// 从数组中随机取元素
	fmt.Printf("%+v\n", randomAccess([]int{1, 2, 3, 4, 5, 6, 0}))
	// 数组扩容
	fmt.Printf("%+v\n", extend([]int{1, 2, 3}, 3))
	// 数组插入元素
	fmt.Printf("%+v\n", insert([]int{1, 2, 3}, 4, 2))
	// 移除数组元素
	fmt.Printf("%+v\n", remove([]int{1, 2, 3}, 0))
	// 数组遍历
	traverse([]int{1, 2, 3})
	// 数组查找
	fmt.Printf("%+v\n", find([]int{1, 2, 3}, 2))
}
