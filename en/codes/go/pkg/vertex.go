// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex represents a graph vertex.
type Vertex struct {
	Val int
}

// NewVertex constructs a vertex.
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets deserializes a list of values into a list of vertices.
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals serializes a list of vertices into a list of values.
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms removes the specified elements from a slice.
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// First, collect the elements in a set
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// Filter out the specified elements
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
