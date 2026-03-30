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

/* Получить корневой узел */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Поиск узла */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Искать в цикле и выйти после прохода за листовой узел
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

/* Вставка узла */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// Если дерево пусто, инициализировать корневой узел
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Позиция узла, предшествующего вставляемому
	var pre *TreeNode = nil
	// Искать в цикле и выйти после прохода за листовой узел
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
	// Если дерево пусто, сразу вернуть
	if cur == nil {
		return
	}
	// Позиция узла, предшествующего удаляемому
	var pre *TreeNode = nil
	// Искать в цикле и выйти после прохода за листовой узел
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
	// Если узел для удаления отсутствует, сразу вернуть
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
			// Если удаляемый узел является корнем, заново назначить корневой узел
			bst.root = child
		}
		// Число дочерних узлов равно 2
	} else {
		// Получить следующий после cur узел в симметричном обходе для удаляемого узла
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Рекурсивно удалить узел tmp
		bst.remove(tmp.Val.(int))
		// Перезаписать cur значением tmp
		cur.Val = tmp.Val
	}
}

/* Вывести двоичное дерево поиска */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
