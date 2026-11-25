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
	// Инициализация пустого дерева
	bst.root = nil
	return bst
}

/* Получить корень */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Поиск узла */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Искать в цикле до выхода за пределы листа
	for node != nil {
		if node.Val.(int) < num {
			// Искомый узел в правом поддереве cur
			node = node.Right
		} else if node.Val.(int) > num {
			// Искомый узел в левом поддереве cur
			node = node.Left
		} else {
			// Узел найден: выйти из цикла
			break
		}
	}
	// Вернуть искомый узел
	return node
}

/* Вставка узла */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// Если дерево пусто, создать корень
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Позиция родителя вставляемого узла
	var pre *TreeNode = nil
	// Искать в цикле до выхода за пределы листа
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
	// Вставка узла
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* Удаление узла */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// Если дерево пусто, сразу завершить вызов
	if cur == nil {
		return
	}
	// Позиция родителя удаляемого узла
	var pre *TreeNode = nil
	// Искать в цикле до выхода за пределы листа
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// Удаляемый узел в правом поддереве
			cur = cur.Right
		} else {
			// Удаляемый узел в левом поддереве
			cur = cur.Left
		}
	}
	// Если узел для удаления не найден, завершить вызов
	if cur == nil {
		return
	}
	// Число потомков равно 0 или 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// Получить потомка удаляемого узла
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
			// Если удаляется корень, назначить новый корень
			bst.root = child
		}
		// Число потомков равно 2
	} else {
		// Найти узел, следующий за удаляемым узлом cur при симметричном обходе
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Рекурсивно удалить узел tmp
		bst.remove(tmp.Val.(int))
		// Заменить значение cur значением tmp
		cur.Val = tmp.Val
	}
}

/* Вывести двоичное дерево поиска */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
