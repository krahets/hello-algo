// File: graph_adjacency_list.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import (
	"fmt"
	"strconv"
	"strings"
)

/* 顶点类 */
type vertex struct {
	val int
}

/* 构造方法 */
func newVertex(val int) vertex {
	return vertex{
		val: val,
	}
}

/* 基于邻接表实现的无向图类 */
type graphAdjList struct {
	// 邻接表，使用哈希表来代替链表，以提升删除边、删除顶点的效率
	// 请注意，adjList 中的元素是 Vertex 对象
	adjList map[vertex]map[vertex]struct{}
}

/* 构造方法 */
func newGraphAdjList(edges [][]vertex) *graphAdjList {
	g := &graphAdjList{
		adjList: make(map[vertex]map[vertex]struct{}),
	}
	// 添加所有顶点和边
	for _, edge := range edges {
		g.addVertex(edge[0])
		g.addVertex(edge[1])
		g.addEdge(edge[0], edge[1])
	}
	return g
}

/* 获取顶点数量 */
func (g *graphAdjList) size() int {
	return len(g.adjList)
}

/* 添加边 */
func (g *graphAdjList) addEdge(vet1 vertex, vet2 vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// 添加边 vet1 - vet2, 添加匿名 struct{},
	g.adjList[vet1][vet2] = struct{}{}
	g.adjList[vet2][vet1] = struct{}{}
}

/* 删除边 */
func (g *graphAdjList) removeEdge(vet1 vertex, vet2 vertex) {
	_, ok1 := g.adjList[vet1]
	_, ok2 := g.adjList[vet2]
	if !ok1 || !ok2 || vet1 == vet2 {
		panic("error")
	}
	// 删除边 vet1 - vet2, 借助 delete 来删除 map 中的键
	delete(g.adjList[vet1], vet2)
	delete(g.adjList[vet2], vet1)
}

/* 添加顶点 */
func (g *graphAdjList) addVertex(vet vertex) {
	_, ok := g.adjList[vet]
	if ok {
		return
	}
	// 在邻接表中添加一个新链表
	g.adjList[vet] = make(map[vertex]struct{})
}

/* 删除顶点 */
func (g *graphAdjList) removeVertex(vet vertex) {
	_, ok := g.adjList[vet]
	if !ok {
		panic("error")
	}
	// 在邻接表中删除顶点 vet 对应的链表
	delete(g.adjList, vet)
	// 遍历其它顶点的链表，删除所有包含 vet 的边
	for _, set := range g.adjList {
		// 操作
		delete(set, vet)
	}
}

/* 打印邻接表 */
func (g *graphAdjList) print() {
	var builder strings.Builder
	fmt.Printf("邻接表 = \n")
	for k, v := range g.adjList {
		builder.WriteString("\t\t" + strconv.Itoa(k.val) + ": ")
		for vet := range v {
			builder.WriteString(strconv.Itoa(vet.val) + " ")
		}
		fmt.Println(builder.String())
		builder.Reset()
	}
}
