// File: binary_search_tree.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

type binarySearchTree struct {
	root *TreeNode
}

func newBinarySearchTree() *binarySearchTree {
	bst := &binarySearchTree{}
	// Инициализировать пустое дерево
	bst.root = nil
	return bst
}

/* Получитькорневой узел */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Найти узел */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Выполнять поиск в цикле и выйти после прохождения листового узла
	for node != nil {
		if node.Val.(int) < num {
			// Целевой узел находится в правом поддереве cur
			node = node.Right
		} else if node.Val.(int) > num {
			// Целевой узел находится в левом поддереве cur
			node = node.Left
		} else {
			// Найти целевой узел и выйти из цикла
			break
		}
	}
	// Вернуть целевой узел
	return node
}

/* Вставить узел */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// Если дерево пусто, инициализировать корневой узел
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Позиция узла перед вставляемым узлом
	var pre *TreeNode = nil
	// Выполнять поиск в цикле и выйти после прохождения листового узла
	for cur != nil {
		if cur.Val == num {
			return
		}
		pre = cur
		if cur.Val.(int) < num {
			cur = cur.Right
		} else {
			cur = cur.Left
		}
	}
	// Вставить узел
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* Удалить узел */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// Если дерево пусто, сразу вернуть результат
	if cur == nil {
		return
	}
	// Позиция узла перед удаляемым узлом
	var pre *TreeNode = nil
	// Выполнять поиск в цикле и выйти после прохождения листового узла
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// Удаляемый узел находится в правом поддереве
			cur = cur.Right
		} else {
			// Удаляемый узел находится в левом поддереве
			cur = cur.Left
		}
	}
	// Если узла для удаления нет, сразу вернуть результат
	if cur == nil {
		return
	}
	// Число дочерних узлов равно 0 или 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// Извлечь дочерний узел удаляемого узла
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// Удалить узел cur
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// Если удаляемый узел является корневым, заново назначить корневой узел
			bst.root = child
		}
		// Число дочерних узлов равно 2
	} else {
		// Получить следующий узел удаляемого узла cur при симметричном обходе
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Рекурсивно удалить узел tmp
		bst.remove(tmp.Val.(int))
		// Заменить cur значением tmp
		cur.Val = tmp.Val
	}
}

/* Вывестидвоичное дерево поиска */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
