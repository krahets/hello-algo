// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* Построение двоичного дерева методом «разделяй и властвуй» */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// Если интервал поддерева пуст, завершаем рекурсию
	if r-l < 0 {
		return nil
	}
	// Создаём корень
	root := NewTreeNode(preorder[i])
	// Находим m и разделяем левое и правое поддеревья
	m := inorderMap[preorder[i]]
	// Подзадача: строим левое поддерево
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// Подзадача: строим правое поддерево
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// Возвращаем корень
	return root
}

/* Построение двоичного дерева */
func buildTree(preorder, inorder []int) *TreeNode {
	// Создаём хеш-таблицу индексов элементов inorder
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
