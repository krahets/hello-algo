// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* 隣接行列で無向グラフを表すクラス */
type graphAdjMat struct {
	// 頂点リスト。要素は頂点の値を、インデックスは頂点のインデックスを表す
	vertices []int
	// 隣接行列。行と列のインデックスは頂点のインデックスに対応する
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
	// edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
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
	// 新しい頂点の値を頂点リストに追加する
	g.vertices = append(g.vertices, val)
	// 隣接行列に行を 1 つ追加する
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// 隣接行列に列を 1 つ追加する
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
// 引数 i と j は vertices の要素のインデックス
func (g *graphAdjMat) addEdge(i, j int) {
	// インデックスが範囲外または同じ値の場合の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// 無向グラフの隣接行列は主対角線に関して対称で、(i, j) == (j, i) を満たす
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* 辺を削除する */
// 引数 i と j は vertices の要素のインデックス
func (g *graphAdjMat) removeEdge(i, j int) {
	// インデックスが範囲外または同じ値の場合の処理
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
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
