// File: array_binary_tree_test.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestArrayBinaryTree(t *testing.T) {
	// Инициализировать двоичное дерево
	// Здесь используется функция, напрямую строящая двоичное дерево из массива
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nИнициализация двоичного дерева")
	fmt.Println("Массивное представление двоичного дерева:")
	fmt.Println(arr)
	fmt.Println("Связное представление двоичного дерева:")
	PrintTree(root)

	// Класс двоичного дерева в массивном представлении
	abt := newArrayBinaryTree(arr)

	// Доступ к узлу
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nТекущий узел: индекс =", i, ", значение =", abt.val(i))
	fmt.Println("Индекс левого дочернего узла =", l, ", значение =", abt.val(l))
	fmt.Println("Индекс правого дочернего узла =", r, ", значение =", abt.val(r))
	fmt.Println("Индекс родительского узла =", p, ", значение =", abt.val(p))

	// Обходить дерево
	res := abt.levelOrder()
	fmt.Println("\nОбход в ширину =", res)
	res = abt.preOrder()
	fmt.Println("Предварительный обход =", res)
	res = abt.inOrder()
	fmt.Println("Симметричный обход =", res)
	res = abt.postOrder()
	fmt.Println("Обратный обход =", res)
}
