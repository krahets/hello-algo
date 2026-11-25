// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 원판 하나를 옮긴다 */
func move(src, tar *list.List) {
	// src 맨 위의 원판 하나를 꺼낸다
	pan := src.Back()
	// 원판을 tar 맨 위에 놓는다
	tar.PushBack(pan.Value)
	// src 맨 위의 원판을 꺼낸다
	src.Remove(pan)
}

/* 하노이의 탑 문제 f(i)를 푼다 */
func dfsHanota(i int, src, buf, tar *list.List) {
	// src에 원판 하나만 남으면 바로 tar로 옮긴다
	if i == 1 {
		move(src, tar)
		return
	}
	// 부분 문제 f(i-1): tar를 보조 기둥으로 써서 src 위의 원판 i-1개를 buf로 옮긴다
	dfsHanota(i-1, src, tar, buf)
	// 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
	move(src, tar)
	// 부분 문제 f(i-1): src를 보조 기둥으로 써서 buf 위의 원판 i-1개를 tar로 옮긴다
	dfsHanota(i-1, buf, src, tar)
}

/* 하노이의 탑 문제 풀기 */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// B를 보조 기둥으로 써서 A 위의 원판 n개를 C로 옮긴다
	dfsHanota(n, A, B, C)
}
