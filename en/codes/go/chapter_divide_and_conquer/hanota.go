// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* Move a disk */
func move(src, tar *list.List) {
	// Take out a disk from the top of src
	pan := src.Back()
	// Place the disk on top of tar
	tar.PushBack(pan.Value)
	// Remove top disk from src
	src.Remove(pan)
}

/* Solve the Tower of Hanoi problem f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// If there is only one disk left in src, move it directly to tar
	if i == 1 {
		move(src, tar)
		return
	}
	// Subproblem f(i-1): move the top i-1 disks from src to buf using tar
	dfsHanota(i-1, src, tar, buf)
	// Subproblem f(1): move the remaining disk from src to tar
	move(src, tar)
	// Subproblem f(i-1): move the top i-1 disks from buf to tar using src
	dfsHanota(i-1, buf, src, tar)
}

/* Solve the Tower of Hanoi problem */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// Move the top n disks from A to C using B
	dfsHanota(n, A, B, C)
}
