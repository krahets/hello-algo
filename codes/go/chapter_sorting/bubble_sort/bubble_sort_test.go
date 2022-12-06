// File: bubble_sort_test.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package bubble_sort

import (
	"fmt"
	"testing"
)

func TestBubbleSort(t *testing.T) {
	var (
		arr = []int{5, 4, 3, 2, 1}
	)
	fmt.Println("冒泡排序前的数组:", arr)
	bubbleSort(arr)
	for i := 1; i < len(arr); i++ {
		if arr[i] < arr[i-1] {
			t.Errorf("排序不正确")
			break
		}
	}
	fmt.Println("冒泡排序后的数组:", arr)
}

func TestBubbleSortWithFlag(t *testing.T) {
	var (
		arr = []int{5, 4, 3, 2, 1}
	)
	fmt.Println("冒泡排序前的数组:", arr)
	bubbleSortWithFlag(arr)
	for i := 1; i < len(arr); i++ {
		if arr[i] < arr[i-1] {
			t.Errorf("排序不正确")
			break
		}
	}
	fmt.Println("冒泡排序后的数组:", arr)
}
