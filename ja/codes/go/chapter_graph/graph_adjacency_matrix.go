// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 隣接行列で実装した無向グラフクラス */
type graphAdjMat struct {
	// 頂点リスト。要素は「頂点の値」、インデックスは「頂点のインデックス」を表す
	vertices []int
	// 隣接行列。行と列のインデックスは「頂点のインデックス」に対応する
	adjMat [][]int
}

/* コンストラクタ */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// 頂点を追加する
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
	// 辺を追加する
	// edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* 頂点数を取得する */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* 頂点を追加する */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// 頂点リストに新しい頂点の値を追加する
	g.vertices = append(g.vertices, val)
	// 隣接行列に 1 行追加する
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 隣接行列に 1 列追加する
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* 頂点を削除する */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// 頂点リストからインデックス index の頂点を削除する
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// 隣接行列からインデックス index の行を削除する
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// 隣接行列からインデックス index の列を削除する
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* 辺を追加する */
// 引数 i, j は vertices の要素のインデックスに対応する
func (g *graphAdjMat) addEdge(i, j int) {
	// 添字が範囲外または互いに等しい場合の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "インデックス範囲外の例外")
	}
	// 無向グラフの隣接行列は主対角線に関して対称であり、(i, j) == (j, i) を満たす
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 辺を削除する */
// 引数 i, j は vertices の要素のインデックスに対応する
func (g *graphAdjMat) removeEdge(i, j int) {
	// 添字が範囲外または互いに等しい場合の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "インデックス範囲外の例外")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* 隣接行列を表示する */
func (g *graphAdjMat) print() {
	fmt.Printf("\t頂点リスト = %v\n", g.vertices)
	fmt.Printf("\t隣接行列 = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
