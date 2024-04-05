// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 基於鄰接矩陣實現的無向圖類別 */
type graphAdjMat struct {
	// 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
	vertices []int
	// 鄰接矩陣，行列索引對應“頂點索引”
	adjMat [][]int
}

/* 建構子 */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// 新增頂點
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// 初始化圖
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// 新增邊
	// 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 獲取頂點數量 */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 新增頂點 */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 向頂點串列中新增新頂點的值
	g.vertices = append(g.vertices, val)
	// 在鄰接矩陣中新增一行
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 在鄰接矩陣中新增一列
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 刪除頂點 */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 在頂點串列中移除索引 index 的頂點
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 在鄰接矩陣中刪除索引 index 的行
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 在鄰接矩陣中刪除索引 index 的列
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 新增邊 */
// 參數 i, j 對應 vertices 元素索引
func (g *graphAdjMat) addEdge(i, j int) {
	// 索引越界與相等處理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 刪除邊 */
// 參數 i, j 對應 vertices 元素索引
func (g *graphAdjMat) removeEdge(i, j int) {
	// 索引越界與相等處理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* 列印鄰接矩陣 */
func (g *graphAdjMat) print() {
	fmt.Printf("\t頂點串列 = %v\n", g.vertices)
	fmt.Printf("\t鄰接矩陣 = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
