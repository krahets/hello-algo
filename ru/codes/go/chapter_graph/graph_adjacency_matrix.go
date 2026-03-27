// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* Класс неориентированного графа на основе матрицы смежности */
type graphAdjMat struct {
	// Список вершин: элементы представляют «значения вершин», а индексы представляют «индексы вершин»
	vertices []int
	// Матрица смежности, индексы строк и столбцов соответствуют «индексам вершин»
	adjMat [][]int
}

/* Конструктор */
func newGraphAdjMat(vertices []int, edges [][]int) *graphAdjMat {
	// Добавить вершину
	n := len(vertices)
	adjMat := make([][]int, n)
	for i := range adjMat {
		adjMat[i] = make([]int, n)
	}
	// Инициализироватьграф
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// Добавить ребро
	// Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* Получить количество вершин */
func (g *graphAdjMat) size() int {
	return len(g.vertices)
}

/* Добавить вершину */
func (g *graphAdjMat) addVertex(val int) {
	n := g.size()
	// Добавить значение новой вершины в список вершин
	g.vertices = append(g.vertices, val)
	// Добавить строку в матрицу смежности
	newRow := make([]int, n)
	g.adjMat = append(g.adjMat, newRow)
	// Добавить столбец в матрицу смежности
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i], 0)
	}
}

/* Удалить вершину */
func (g *graphAdjMat) removeVertex(index int) {
	if index >= g.size() {
		return
	}
	// Удалить вершину с индексом index из списка вершин
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// Удалить строку с индексом index из матрицы смежности
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// Удалить столбец с индексом index из матрицы смежности
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* Добавить ребро */
// Параметры i и j соответствуют индексам элементов vertices
func (g *graphAdjMat) addEdge(i, j int) {
	// Обработка выхода индекса за границы и случая равенства
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* Удалить ребро */
// Параметры i и j соответствуют индексам элементов vertices
func (g *graphAdjMat) removeEdge(i, j int) {
	// Обработка выхода индекса за границы и случая равенства
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* Вывести матрицу смежности */
func (g *graphAdjMat) print() {
	fmt.Printf("\tсписок вершин = %v\n", g.vertices)
	fmt.Printf("\tМатрица смежности = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
