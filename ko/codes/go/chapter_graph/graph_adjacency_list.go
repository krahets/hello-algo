// File: graph_adjacency_list.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"strconv"
	"strings"

	. "github.com/krahets/hello-algo/pkg"
)

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
type graphAdjList struct {
	// 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
	adjList map[Vertex][]Vertex
}

/* 생성자 */
func newGraphAdjList(edges [][]Vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[Vertex][]Vertex),
	}
	// 모든 정점과 간선을 추가한다
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* 정점 개수 반환 */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* 간선 추가 */
func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("오류")
	}
	// 간선 vet1 - vet2를 추가하고 익명 struct{}를 추가한다
	g.adjList[vet1] = append(g.adjList[vet1], vet2)
	g.adjList[vet2] = append(g.adjList[vet2], vet1)
}

/* 간선 삭제 */
func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("오류")
	}
	// 간선 vet1 - vet2를 삭제한다
	g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
	g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
}

/* 정점 추가 */
func (g *graphAdjList) addVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// 인접 리스트에 새 연결 리스트를 추가한다
	g.adjList[vet] = make([]Vertex, 0)
}

/* 정점 삭제 */
func (g *graphAdjList) removeVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("오류")
	}
	// 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
	delete(g.adjList, vet)
	// 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
	for v, list := range g.adjList {
		g.adjList[v] = DeleteSliceElms(list, vet)
	}
}

/* 인접 리스트 출력 */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("인접 리스트 = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
		for _, vet := range v {
			builder.WriteString(strconv.Itoa(vet.Val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
