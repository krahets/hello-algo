// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* Класс двоичного дерева в массивном представлении */
type arrayBinaryTree struct {
	tree []any
}

/* Конструктор */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* Вместимость списка */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* Получить значение узла с индексом i */
func (abt *arrayBinaryTree) val(i int) any {
	// Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* Получить индекс левого дочернего узла узла с индексом i */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* Получить индекс правого дочернего узла узла с индексом i */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* Получить индекс родительского узла узла с индексом i */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* Обход в ширину */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// Непосредственно обходить массив
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* Обход в глубину */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// Если это пустая позиция, вернуть
	if abt.val(i) == nil {
		return
	}
	// Предварительный обход
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// Симметричный обход
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// Обратный обход
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* Предварительный обход */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* Симметричный обход */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* Обратный обход */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
