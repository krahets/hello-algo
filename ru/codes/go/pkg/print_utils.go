// File: print_utils.go
// Created Time: 2022-12-03
// Author: Reanon (793584285@qq.com), krahets (krahets@163.com), msk397 (machangxinq@gmail.com)

package pkg

import (
	"container/list"
	"fmt"
	"strconv"
	"strings"
)

// PrintSlice выводит срез
func PrintSlice[T any](nums []T) {
	fmt.Printf("%v", nums)
	fmt.Println()
}

// PrintList выводит список
func PrintList(list *list.List) {
	if list.Len() == 0 {
		fmt.Print("[]\n")
		return
	}
	e := list.Front()
	// Явное приведение к типу string влияет на производительность
	fmt.Print("[")
	for e.Next() != nil {
		fmt.Print(e.Value, " ")
		e = e.Next()
	}
	fmt.Print(e.Value, "]\n")
}

// PrintMap выводит хеш-таблицу
func PrintMap[K comparable, V any](m map[K]V) {
	for key, value := range m {
		fmt.Println(key, "->", value)
	}
}

// PrintHeap выводит кучу
func PrintHeap(h []any) {
	fmt.Printf("Куча в виде массива: ")
	fmt.Printf("%v", h)
	fmt.Printf("\nКуча в виде дерева:\n")
	root := SliceToTree(h)
	PrintTree(root)
}

// PrintLinkedList выводит связный список
func PrintLinkedList(node *ListNode) {
	if node == nil {
		return
	}
	var builder strings.Builder
	for node.Next != nil {
		builder.WriteString(strconv.Itoa(node.Val) + " -> ")
		node = node.Next
	}
	builder.WriteString(strconv.Itoa(node.Val))
	fmt.Println(builder.String())
}

// PrintTree выводит двоичное дерево
func PrintTree(root *TreeNode) {
	printTreeHelper(root, nil, false)
}

// printTreeHelper выводит двоичное дерево
// Код для вывода дерева заимствован у TECHIE DELIGHT
// https://www.techiedelight.com/c-program-print-binary-tree/
func printTreeHelper(root *TreeNode, prev *trunk, isRight bool) {
	if root == nil {
		return
	}
	prevStr := "    "
	trunk := newTrunk(prev, prevStr)
	printTreeHelper(root.Right, trunk, true)
	if prev == nil {
		trunk.str = "———"
	} else if isRight {
		trunk.str = "/———"
		prevStr = "   |"
	} else {
		trunk.str = "\\———"
		prev.str = prevStr
	}
	showTrunk(trunk)
	fmt.Println(root.Val)
	if prev != nil {
		prev.str = prevStr
	}
	trunk.str = "   |"
	printTreeHelper(root.Left, trunk, false)
}

type trunk struct {
	prev *trunk
	str  string
}

func newTrunk(prev *trunk, str string) *trunk {
	return &trunk{
		prev: prev,
		str:  str,
	}
}

func showTrunk(t *trunk) {
	if t == nil {
		return
	}

	showTrunk(t.prev)
	fmt.Print(t.str)
}
