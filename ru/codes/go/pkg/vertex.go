// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex: класс вершины
type Vertex struct {
	Val int
}

// NewVertex: конструктор вершины
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets десериализует список значений в список вершин
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals сериализует список вершин в список значений
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms удаляет указанный элемент из среза
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// Сначала преобразовать элементы в set
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// Отфильтровать указанный элемент
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
