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

/* 基於鄰接表實現的無向圖類別 */
type graphAdjList struct {
	// 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
	adjList map[Vertex][]Vertex
}

/* 建構子 */
func newGraphAdjList(edges [][]Vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[Vertex][]Vertex),
	}
	// 新增所有頂點和邊
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* 獲取頂點數量 */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* 新增邊 */
func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// 新增邊 vet1 - vet2, 新增匿名 struct{},
	g.adjList[vet1] = append(g.adjList[vet1], vet2)
	g.adjList[vet2] = append(g.adjList[vet2], vet1)
}

/* 刪除邊 */
func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// 刪除邊 vet1 - vet2
	g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
	g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
}

/* 新增頂點 */
func (g *graphAdjList) addVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// 在鄰接表中新增一個新鏈結串列
	g.adjList[vet] = make([]Vertex, 0)
}

/* 刪除頂點 */
func (g *graphAdjList) removeVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("error")
	}
	// 在鄰接表中刪除頂點 vet 對應的鏈結串列
	delete(g.adjList, vet)
	// 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
	for v, list := range g.adjList {
		g.adjList[v] = DeleteSliceElms(list, vet)
	}
}

/* 列印鄰接表 */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("鄰接表 = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
		for _, vet := range v {
			builder.WriteString(strconv.Itoa(vet.Val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
