// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* Move a disc */
func move(src, tar *list.List) {
	// Take out a disc from the top of src
	pan := src.Back()
	// Place the disc on top of tar
	tar.PushBack(pan.Value)
	// Remove the top disc from src
	src.Remove(pan)
}

/* Solve the Tower of Hanoi problem f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// If only one disc remains on src, move it to tar
	if i == 1 {
		move(src, tar)
		return
	}
	// Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
	dfsHanota(i-1, src, tar, buf)
	// Subproblem f(1): move the remaining one disc from src to tar
	move(src, tar)
	// Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
	dfsHanota(i-1, buf, src, tar)
}

/* Solve the Tower of Hanoi problem */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// Move the top n discs from A with the help of B to C
	dfsHanota(n, A, B, C)
}
