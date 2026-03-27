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
	// Здесь используется функция, которая напрямую строит двоичное дерево из массива
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nИнициализировать двоичное дерево")
	fmt.Println("Массивное представление двоичного дерева:")
	fmt.Println(arr)
	fmt.Println("Связное представление двоичного дерева:")
	PrintTree(root)

	// Класс двоичного дерева в массивном представлении
	abt := newArrayBinaryTree(arr)

	// Получить доступ к узлу
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nИндекс текущего узла равен", i, ", значение равно", abt.val(i))
	fmt.Println("Индекс его левого дочернего узла равен", l, ", значение равно", abt.val(l))
	fmt.Println("Индекс его правого дочернего узла равен", r, ", значение равно", abt.val(r))
	fmt.Println("Индекс его родительского узла равен", p, ", значение равно", abt.val(p))

	// Обойти дерево
	res := abt.levelOrder()
	fmt.Println("\nРезультат обхода по уровням: ", res)
	res = abt.preOrder()
	fmt.Println("прямой обходравно:", res)
	res = abt.inOrder()
	fmt.Println("Симметричный обход: ", res)
	res = abt.postOrder()
	fmt.Println("обратный обходравно:", res)
}
