// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* АВЛ-дерево */
type aVLTree struct {
	// Корень
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* Получить высоту узла */
func (t *aVLTree) height(node *TreeNode) int {
	// Высота пустого узла равна -1, высота листа равна 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* Обновить высоту узла */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// Высота узла на 1 больше высоты самого высокого поддерева
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
	// Коэффициент баланса узла равен высоте левого поддерева минус высота правого
	return t.height(node.Left) - t.height(node.Right)
}

/* Правый поворот */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// Повернуть node вправо вокруг child
	child.Right = node
	node.Left = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корень поддерева после поворота
	return child
}

/* Левый поворот */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// Повернуть node влево вокруг child
	child.Left = node
	node.Right = grandChild
	// Обновить высоту узла
	t.updateHeight(node)
	t.updateHeight(child)
	// Вернуть корень поддерева после поворота
	return child
}

/* Выполнить поворот, чтобы восстановить баланс поддерева */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// Получить коэффициент баланса узла node
	// В Go принято использовать короткие имена переменных: здесь bf обозначает t.balanceFactor
	bf := t.balanceFactor(node)
	// Перевес влево
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// Поворот вправо
			return t.rightRotate(node)
		} else {
			// Сначала поворот влево, затем вправо
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// Перевес вправо
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// Поворот влево
			return t.leftRotate(node)
		} else {
			// Сначала поворот вправо, затем влево
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// Дерево сбалансировано: завершить вызов без поворота
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
	/* 1. Найти место вставки и вставить узел */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// Такой узел уже есть: завершить вызов без вставки
		return node
	}
	// Обновить высоту узла
	t.updateHeight(node)
	/* 2. Восстановить баланс поддерева с помощью поворота */
	node = t.rotate(node)
	// Вернуть корень поддерева
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
	/* 1. Найти и удалить узел */
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
				// Нет потомков: удалить node и завершить вызов
				return nil
			} else {
				// Один потомок: удалить node
				node = child
			}
		} else {
			// Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
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
	/* 2. Восстановить баланс поддерева с помощью поворота */
	node = t.rotate(node)
	// Вернуть корень поддерева
	return node
}

/* Поиск узла */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// Искать в цикле до выхода за пределы листа
	for cur != nil {
		if cur.Val.(int) < val {
			// Искомый узел в правом поддереве cur
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// Искомый узел в левом поддереве cur
			cur = cur.Left
		} else {
			// Узел найден: выйти из цикла
			break
		}
	}
	// Вернуть искомый узел
	return cur
}
