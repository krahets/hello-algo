// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex 顶点类
type Vertex struct {
	Val int
}

// NewVertex 构造方法
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets Generate a vertex list tree given an array
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals Serialize given vertex list to a value list
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}
