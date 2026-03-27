// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL-дерево */
type aVLTree struct {
	// корневой узел
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* Получить высоту узла */
func (t *aVLTree) height(node *TreeNode) int {
	// Высота пустого узла равна -1, а высота листа равна 0
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
	// Баланс-фактор пустого узла равен 0
	if node == nil {
		return 0
	}
	// Баланс-фактор узла = высота левого поддерева - высота правого поддерева
	return t.height(node.Left) - t.height(node.Right)
}

/* Операция правого поворота */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// Используя child как опорную точку, выполнить правый поворот node
	child.Right = node
	node.Left = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корневой узел поддерева после вращения
	return child
}

/* Операция левого поворота */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// Используя child как опорную точку, выполнить левый поворот node
	child.Left = node
	node.Right = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корневой узел поддерева после вращения
	return child
}

/* Выполнить поворот, чтобы восстановить баланс этого поддерева */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// Получить коэффициент баланса узла node
	// В Go рекомендуется использовать короткие переменные, здесь bf означает t.balanceFactor
	bf := t.balanceFactor(node)
	// Левосторонне перекошенное дерево
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// Правый поворот
			return t.rightRotate(node)
		} else {
			// Сначала выполнить левый поворот, затем правый
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// Правосторонне перекошенное дерево
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// Левый поворот
			return t.leftRotate(node)
		} else {
			// Сначала выполнить правый поворот, затем левый
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
	return node
}

/* Вставить узел */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* рекурсиявставить узел(вспомогательная функция) */
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
		// Дублирующийся узел не вставлять, сразу вернуть результат
		return node
	}
	// Обновить высоту узла
	t.updateHeight(node)
	/* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
	node = t.rotate(node)
	// Вернуть корневой узел поддерева
	return node
}

/* Удалить узел */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* рекурсияУдалить узел(вспомогательная функция) */
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
				// Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
				return nil
			} else {
				// Если число дочерних узлов равно 1, сразу удалить node
				node = child
			}
		} else {
			// Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
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
	/* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
	node = t.rotate(node)
	// Вернуть корневой узел поддерева
	return node
}

/* Найти узел */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// Выполнять поиск в цикле и выйти после прохождения листового узла
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
