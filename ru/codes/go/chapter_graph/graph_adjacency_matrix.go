// File: graph_adjacency_matrix.go
// Created Time: 2023-01-31
// Author: Reanon (793584285@qq.com)

package chapter_graph

import "fmt"

/* Неориентированный граф на матрице смежности */
type graphAdjMat struct {
	// Список вершин: элементы — значения вершин, позиции — их индексы
	vertices []int
	// Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
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
	// Инициализировать граф
	g := &graphAdjMat{
		vertices: vertices,
		adjMat:   adjMat,
	}
	// Добавить ребро
	// Элементы edges содержат индексы вершин, то есть индексы элементов vertices
	for i := range edges {
		g.addEdge(edges[i][0], edges[i][1])
	}
	return g
}

/* Получить число вершин */
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
	// Удалить из списка вершин вершину с индексом index
	g.vertices = append(g.vertices[:index], g.vertices[index+1:]...)
	// Удалить из матрицы смежности строку с индексом index
	g.adjMat = append(g.adjMat[:index], g.adjMat[index+1:]...)
	// Удалить из матрицы смежности столбец с индексом index
	for i := range g.adjMat {
		g.adjMat[i] = append(g.adjMat[i][:index], g.adjMat[i][index+1:]...)
	}
}

/* Добавить ребро */
// Параметры i и j — индексы элементов vertices
func (g *graphAdjMat) addEdge(i, j int) {
	// Проверить выход индексов за границы и их совпадение
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	// Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
	g.adjMat[i][j] = 1
	g.adjMat[j][i] = 1
}

/* Удалить ребро */
// Параметры i и j — индексы элементов vertices
func (g *graphAdjMat) removeEdge(i, j int) {
	// Проверить выход индексов за границы и их совпадение
	if i < 0 || j < 0 || i >= g.size() || j >= g.size() || i == j {
		fmt.Errorf("%s", "Index Out Of Bounds Exception")
	}
	g.adjMat[i][j] = 0
	g.adjMat[j][i] = 0
}

/* Вывести матрицу смежности */
func (g *graphAdjMat) print() {
	fmt.Printf("\tСписок вершин = %v\n", g.vertices)
	fmt.Printf("\tМатрица смежности = \n")
	for i := range g.adjMat {
		fmt.Printf("\t\t\t%v\n", g.adjMat[i])
	}
}
