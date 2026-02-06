// File: bubble_sort_bench_test.go
// Created Time: 2026-02-06
// Author: Contributor (contributor@example.com)

package chapter_sorting

import (
	"fmt"
	"math/rand"
	"testing"
	"time"
)

func BenchmarkBubbleSort(b *testing.B) {
	sizes := []int{100, 500, 1000}
	for _, size := range sizes {
		b.Run(fmt.Sprintf("size-%d", size), func(b *testing.B) {
			b.StopTimer()
			nums := make([]int, size)
			rand.Seed(time.Now().UnixNano())

			b.StartTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				for j := 0; j < size; j++ {
					nums[j] = rand.Intn(size)
				}
				b.StartTimer()
				bubbleSort(nums)
			}
		})
	}
}

func BenchmarkBubbleSortWithFlag(b *testing.B) {
	sizes := []int{100, 500, 1000}
	for _, size := range sizes {
		b.Run(fmt.Sprintf("size-%d", size), func(b *testing.B) {
			b.StopTimer()
			nums := make([]int, size)
			rand.Seed(time.Now().UnixNano())

			b.StartTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				for j := 0; j < size; j++ {
					nums[j] = rand.Intn(size)
				}
				b.StartTimer()
				bubbleSortWithFlag(nums)
			}
		})
	}
}
