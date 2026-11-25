// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex は頂点を表す型
type Vertex struct {
	Val int
}

// NewVertex は頂点を作成する
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets は値のリストをデシリアライズして頂点のリストを復元する
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals は頂点のリストを値のリストにシリアライズする
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms はスライスから指定された要素を削除する
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// まず、削除する要素を集合にまとめる
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// 指定された要素を除外する
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
