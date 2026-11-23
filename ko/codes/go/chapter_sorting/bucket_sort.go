// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* 버킷 정렬 */
func bucketSort(nums []float64) {
	// 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 배열 원소를 각 버킷에 배정한다
	for _, num := range nums {
		// 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
		i := int(num * float64(k))
		// num을 버킷 i에 추가한다
		buckets[i] = append(buckets[i], num)
	}
	// 2. 각 버킷을 정렬한다
	for i := 0; i < k; i++ {
		// 내장 슬라이스 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
		sort.Float64s(buckets[i])
	}
	// 3. 버킷을 순회하여 결과를 합친다
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
