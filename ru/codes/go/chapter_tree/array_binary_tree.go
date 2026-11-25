// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* Класс двоичного дерева на основе массива */
type arrayBinaryTree struct {
	tree []any
}

/* Конструктор */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* Ёмкость списка */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* Получить значение узла с индексом i */
func (abt *arrayBinaryTree) val(i int) any {
	// Если индекс выходит за границы массива, вернуть null — признак пустой позиции
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* Получить индекс левого потомка узла с индексом i */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* Получить индекс правого потомка узла с индексом i */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* Получить индекс родителя узла с индексом i */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* Обход по уровням */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// Пройти непосредственно по массиву
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* Обход в глубину */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// Если позиция пуста, завершить вызов
	if abt.val(i) == nil {
		return
	}
	// Прямой обход
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

/* Прямой обход */
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
