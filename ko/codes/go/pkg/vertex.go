// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex: 정점 클래스
type Vertex struct {
	Val int
}

// NewVertex: 정점 생성자
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets: 값의 리스트를 정점 리스트로 역직렬화한다
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals: 정점 리스트를 값의 리스트로 직렬화한다
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms: 슬라이스에서 지정한 원소를 삭제한다
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// 먼저 원소를 set으로 변환한다
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// 지정한 원소를 걸러 낸다
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
