// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex vertex class
type Vertex struct {
	Val int
}

// NewVertex vertex constructor
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets deserialize value list to vertex list
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals serialize vertex list to value list
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms delete specified elements from slice
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// First convert elements to set
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// Filter out specified elements
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
