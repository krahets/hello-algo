// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
type graphAdjMat struct {
	// 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
	vertices []int
	// 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다
	adjMat [][]int
}

/* 생성자 */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// 정점 추가
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// 그래프 초기화
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// 간선 추가
	// edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 정점 개수 반환 */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 정점 추가 */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 정점 리스트에 새 정점의 값을 추가한다
	g.vertices = append(g.vertices, val)
	// 인접 행렬에 행 하나를 추가한다
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 인접 행렬에 열 하나를 추가한다
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 정점 삭제 */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 정점 리스트에서 인덱스 index의 정점을 제거한다
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 인접 행렬에서 인덱스 index의 행을 삭제한다
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 인접 행렬에서 인덱스 index의 열을 삭제한다
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 간선 추가 */
// 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
func (g *graphAdjMat) addEdge(i, j int) {
	// 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "인덱스가 범위를 벗어났다")
	}
	// 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 간선 삭제 */
// 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
func (g *graphAdjMat) removeEdge(i, j int) {
	// 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "인덱스가 범위를 벗어났다")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* 인접 행렬 출력 */
func (g *graphAdjMat) print() {
	fmt.Printf("\t정점 리스트 = %v\n", g.vertices)
	fmt.Printf("\t인접 행렬 = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
