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

/* 隣接リストで実装した無向グラフクラス */
type graphAdjList struct {
	// 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
	adjList map[Vertex][]Vertex
}

/* コンストラクタ */
func newGraphAdjList(edges [][]Vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[Vertex][]Vertex),
	}
	// すべての頂点と辺を追加する
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* 頂点数を取得する */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* 辺を追加する */
func (g *graphAdjList) addEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("エラー")
	}
	// 辺 vet1 - vet2 を追加し、無名の struct{} を追加する
	g.adjList[vet1] = append(g.adjList[vet1], vet2)
	g.adjList[vet2] = append(g.adjList[vet2], vet1)
}

/* 辺を削除する */
func (g *graphAdjList) removeEdge(vet1 Vertex, vet2 Vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("エラー")
	}
	// 辺 vet1 - vet2 を削除する
	g.adjList[vet1] = DeleteSliceElms(g.adjList[vet1], vet2)
	g.adjList[vet2] = DeleteSliceElms(g.adjList[vet2], vet1)
}

/* 頂点を追加する */
func (g *graphAdjList) addVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// 隣接リストに新しい連結リストを追加する
	g.adjList[vet] = make([]Vertex, 0)
}

/* 頂点を削除する */
func (g *graphAdjList) removeVertex(vet Vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("エラー")
	}
	// 隣接リストから頂点 vet に対応する連結リストを削除する
	delete(g.adjList, vet)
	// 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
	for v, list := range g.adjList {
		g.adjList[v] = DeleteSliceElms(list, vet)
	}
}

/* 隣接リストを表示する */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("隣接リスト = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.Val) + ": ")
		for _, vet := range v {
			builder.WriteString(strconv.Itoa(vet.Val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
