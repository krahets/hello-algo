// File: graph_adjacency_list.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

/* 顶点类 */
type vertex struct {
	val int
}

func newVertex(val int) *vertex {
	return &vertex{
		val: val,
	}
}

/* 基于邻接表实现的无向图类 */
type graphAdjList struct {
	// 请注意，vertices 和 adjList 中存储的都是 Vertex 对象
	// 邻接表（使用哈希表实现）, 使用哈希表模拟集合
	adjList map[vertex]map[vertex]struct{}
}

/* 构造函数 */
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

/* 添加顶点 */
func (g *graphAdjList) addVertex(vet vertex) {

}

/* 删除顶点 */
