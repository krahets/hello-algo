// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 隣接行列に基づく無向グラフクラス */
type graphAdjMat struct {
	// 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
	vertices []int
	// 隣接行列。行・列のインデックスは「頂点インデックス」に対応
	adjMat [][]int
}

/* コンストラクタ */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// 頂点を追加
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// グラフを初期化する
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// 辺を追加
	// 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 頂点数を取得 */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 頂点を追加 */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 頂点リストに新しい頂点の値を追加
	g.vertices = append(g.vertices, val)
	// 隣接行列に 1 行追加
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 隣接行列に 1 列追加
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 頂点を削除 */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 頂点リストから index の頂点を削除する
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 隣接行列で index 行を削除する
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 隣接行列で index 列を削除する
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 辺を追加 */
// 引数 i, j は vertices の要素インデックスに対応する
func (g *graphAdjMat) addEdge(i, j int) {
	// インデックスの範囲外と等値の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 辺を削除 */
// 引数 i, j は vertices の要素インデックスに対応する
func (g *graphAdjMat) removeEdge(i, j int) {
	// インデックスの範囲外と等値の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* 隣接行列を出力 */
func (g *graphAdjMat) print() {
	fmt.Printf("\t頂点リスト = %v\n", g.vertices)
	fmt.Printf("\t隣接行列 = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
