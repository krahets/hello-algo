// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 원판 하나 이동 */
func move(src, tar *list.List) {
	// src의 맨 위에서 원판 하나를 꺼낸다
	pan := src.Back()
	// 원판을 tar의 맨 위에 놓는다
	tar.PushBack(pan.Value)
	// src의 맨 위 원판을 제거한다
	src.Remove(pan)
}

/* 하노이의 탑 문제 f(i) 풀기 */
func dfsHanota(i int, src, buf, tar *list.List) {
	// src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
	if i == 1 {
		move(src, tar)
		return
	}
	// 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
	dfsHanota(i-1, src, tar, buf)
	// 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
	move(src, tar)
	// 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
	dfsHanota(i-1, buf, src, tar)
}

/* 하노이의 탑 문제 풀기 */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
	dfsHanota(n, A, B, C)
}
