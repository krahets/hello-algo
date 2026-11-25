// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
type graphAdjMat struct {
	// 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타냄
	vertices []int
	// 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당
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
	// edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 정점 수 구하기 */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 정점 추가 */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 정점 리스트에 새 정점의 값 추가
	g.vertices = append(g.vertices, val)
	// 인접 행렬에 행 하나 추가
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 인접 행렬에 열 하나 추가
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 정점 삭제 */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 정점 리스트에서 인덱스가 index인 정점 삭제
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 인접 행렬에서 인덱스가 index인 행 삭제
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 인접 행렬에서 인덱스가 index인 열 삭제
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 간선 추가 */
// 매개변수 i, j는 vertices의 원소 인덱스
func (g *graphAdjMat) addEdge(i, j int) {
	// 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 간선 삭제 */
// 매개변수 i, j는 vertices의 원소 인덱스
func (g *graphAdjMat) removeEdge(i, j int) {
	// 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
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
