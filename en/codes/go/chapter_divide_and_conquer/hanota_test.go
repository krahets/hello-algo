// File: hanota_test.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import (
	"container/list"
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHanota(t *testing.T) {
	// The tail of the list is the top of the rod
	A := list.New()
	for i := 5; i > 0; i-- {
		A.PushBack(i)
	}
	B := list.New()
	C := list.New()
	fmt.Println("In initial state:")
	fmt.Print("A = ")
	PrintList(A)
	fmt.Print("B = ")
	PrintList(B)
	fmt.Print("C = ")
	PrintList(C)

	solveHanota(A, B, C)

	fmt.Println("After disk movement is complete:")
	fmt.Print("A = ")
	PrintList(A)
	fmt.Print("B = ")
	PrintList(B)
	fmt.Print("C = ")
	PrintList(C)
}
