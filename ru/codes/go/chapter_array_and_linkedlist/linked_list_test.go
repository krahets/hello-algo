// File: linked_list_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinkedList(t *testing.T) {
	/* Инициализироватьсвязный список 1 -> 3 -> 2 -> 5 -> 4 */
	// Инициализироватькаждый узел
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// Построить ссылки между узлами
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("Инициализированный связный список:")
	PrintLinkedList(n0)

	/* Вставить узел */
	insertNode(n0, NewListNode(0))
	fmt.Println("Связный список после вставки узла:")
	PrintLinkedList(n0)

	/* Удалить узел */
	removeItem(n0)
	fmt.Println("Связный список после удаления узла:")
	PrintLinkedList(n0)

	/* Получить доступ к узлу */
	node := access(n0, 3)
	fmt.Println("Значение узла по индексу 3 в связном списке =", node)

	/* Найти узел */
	index := findNode(n0, 2)
	fmt.Println("Индекс узла со значением 2 в связном списке =", index)
}
