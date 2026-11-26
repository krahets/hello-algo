// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex 代表圖的頂點
type Vertex struct {
	Val int
}

// NewVertex 用來建立頂點
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets 將數值切片反序列化為頂點切片
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals 將頂點切片序列化為數值切片
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms 從切片中移除指定的元素
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// 先將指定的元素轉為集合
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// 濾除指定的元素
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
