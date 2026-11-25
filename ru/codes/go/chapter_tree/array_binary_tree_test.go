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
	// Инициализация двоичного дерева
	// Используем функцию, которая строит двоичное дерево непосредственно из массива
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nИнициализация двоичного дерева")
	fmt.Println("Двоичное дерево в виде массива:")
	fmt.Println(arr)
	fmt.Println("Связное представление двоичного дерева:")
	PrintTree(root)

	// Класс двоичного дерева на основе массива
	abt := newArrayBinaryTree(arr)

	// Доступ к узлу
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nИндекс текущего узла:", i, "значение:", abt.val(i))
	fmt.Println("Индекс левого потомка:", l, "значение:", abt.val(l))
	fmt.Println("Индекс правого потомка:", r, "значение:", abt.val(r))
	fmt.Println("Индекс родителя:", p, "значение:", abt.val(p))

	// Обход дерева
	res := abt.levelOrder()
	fmt.Println("\nОбход по уровням:", res)
	res = abt.preOrder()
	fmt.Println("Прямой обход:", res)
	res = abt.inOrder()
	fmt.Println("Симметричный обход:", res)
	res = abt.postOrder()
	fmt.Println("Обратный обход:", res)
}
