// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* Структура */
type node struct {
	val  int
	next *node
}

/* Создать структуру node */
func newNode(val int) *node {
	return &node{val: val}
}

/* Функция */
func function() int {
	// Выполнить некоторые операции...
	return 0
}

/* Постоянная сложность */
func spaceConstant(n int) {
	// Константы, переменные и объекты занимают O(1) памяти
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// Переменные в цикле занимают O(1) памяти
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// Функции в цикле занимают O(1) памяти
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* Линейная сложность */
func spaceLinear(n int) {
	// Массив длины n занимает O(n) памяти
	_ = make([]int, n)
	// Список длины n занимает O(n) памяти
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// Хеш-таблица длины n занимает O(n) памяти
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* Линейная сложность (рекурсивная реализация) */
func spaceLinearRecur(n int) {
	fmt.Println("Рекурсия n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* Квадратичная сложность */
func spaceQuadratic(n int) {
	// Матрица занимает O(n^2) памяти
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* Квадратичная сложность (рекурсивная реализация) */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("В рекурсии n = %d, длина nums = %d\n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
