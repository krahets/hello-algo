// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex 頂點類別
type Vertex struct {
	Val int
}

// NewVertex 頂點建構子
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets 將值串列反序列化為頂點串列
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals 將頂點串列序列化為值串列
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms 刪除切片指定元素
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// 先將元素轉為 set
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// 過濾掉指定元素
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
