// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL-дерево */
type aVLTree struct {
	// Корневой узел
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* Получить высоту узла */
func (t *aVLTree) height(node *TreeNode) int {
	// Высота пустого узла равна -1, высота листового узла равна 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* Обновить высоту узла */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// Высота узла равна высоте более высокого поддерева + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* Получить коэффициент баланса */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// Коэффициент баланса пустого узла равен 0
	if node == nil {
		return 0
	}
	// Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
	return t.height(node.Left) - t.height(node.Right)
}

/* Операция правого вращения */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// Выполнить правое вращение узла node вокруг child
	child.Right = node
	node.Left = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корневой узел поддерева после вращения
	return child
}

/* Операция левого вращения */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// Выполнить левое вращение узла node вокруг child
	child.Left = node
	node.Right = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корневой узел поддерева после вращения
	return child
}

/* Выполнить вращение, чтобы снова сбалансировать поддерево */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// Получить коэффициент баланса узла node
	// В Go рекомендуется использовать короткие имена переменных, здесь bf обозначает t.balanceFactor
	bf := t.balanceFactor(node)
	// Левосторонне перекошенное дерево
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// Правое вращение
			return t.rightRotate(node)
		} else {
			// Сначала левое вращение, затем правое
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// Правосторонне перекошенное дерево
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// Левое вращение
			return t.leftRotate(node)
		} else {
			// Сначала правое вращение, затем левое
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// Дерево сбалансировано, вращение не требуется, вернуть сразу
	return node
}

/* Вставка узла */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* Рекурсивная вставка узла (вспомогательная функция) */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. Найти позицию вставки и вставить узел */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// Повторяющийся узел не вставлять, сразу вернуть
		return node
	}
	// Обновить высоту узла
	t.updateHeight(node)
	/* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
	node = t.rotate(node)
	// Вернуть корневой узел поддерева
	return node
}

/* Удаление узла */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* Рекурсивное удаление узла (вспомогательная функция) */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. Найти узел и удалить его */
	if val < node.Val.(int) {
		node.Left = t.removeHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.removeHelper(node.Right, val)
	} else {
		if node.Left == nil || node.Right == nil {
			child := node.Left
			if node.Right != nil {
				child = node.Right
			}
			if child == nil {
				// Число дочерних узлов = 0, удалить node и сразу вернуть
				return nil
			} else {
				// Число дочерних узлов = 1, удалить node напрямую
				node = child
			}
		} else {
			// Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// Обновить высоту узла
	t.updateHeight(node)
	/* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
	node = t.rotate(node)
	// Вернуть корневой узел поддерева
	return node
}

/* Поиск узла */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// Искать в цикле и выйти после прохода за листовой узел
	for cur != nil {
		if cur.Val.(int) < val {
			// Целевой узел находится в правом поддереве cur
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// Целевой узел находится в левом поддереве cur
			cur = cur.Left
		} else {
			// Найти целевой узел и выйти из цикла
			break
		}
	}
	// Вернуть целевой узел
	return cur
}
