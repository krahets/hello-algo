// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 以鄰接矩陣實作的無向圖類別 */
type graphAdjMat struct {
	// 頂點清單，元素代表頂點值，索引代表頂點索引
	vertices []int
	// 鄰接矩陣，橫列與直行的索引皆對應頂點索引
	adjMat [][]int
}

/* 建構函式 */
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
	// 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 取得頂點數量 */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 新增頂點 */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 將新頂點的值加入頂點清單
	g.vertices = append(g.vertices, val)
	// 在鄰接矩陣中新增一個橫列
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 在鄰接矩陣中新增一個直行
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 刪除頂點 */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 從頂點清單中移除索引為 index 的頂點
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 從鄰接矩陣中刪除索引為 index 的橫列
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 從鄰接矩陣中刪除索引為 index 的直行
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 新增邊 */
// 參數 i、j 為 vertices 中的元素索引
func (g *graphAdjMat) addEdge(i, j int) {
	// 處理索引超出範圍或兩個索引相同的情形
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 刪除邊 */
// 參數 i、j 為 vertices 中的元素索引
func (g *graphAdjMat) removeEdge(i, j int) {
	// 處理索引超出範圍或兩個索引相同的情形
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* 印出鄰接矩陣 */
func (g *graphAdjMat) print() {
	fmt.Printf("\t頂點清單 = %v\n", g.vertices)
	fmt.Printf("\t鄰接矩陣 = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
