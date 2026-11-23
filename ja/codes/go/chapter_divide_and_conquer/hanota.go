// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 円盤を 1 枚移動する */
func move(src, tar *list.List) {
	// src の一番上から円盤を 1 枚取り出す
	pan := src.Back()
	// tar の一番上に円盤を置く
	tar.PushBack(pan.Value)
	// src の一番上の円盤を取り除く
	src.Remove(pan)
}

/* ハノイの塔の問題 f(i) を解く */
func dfsHanota(i int, src, buf, tar *list.List) {
	// src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
	if i == 1 {
		move(src, tar)
		return
	}
	// 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
	dfsHanota(i-1, src, tar, buf)
	// 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
	move(src, tar)
	// 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
	dfsHanota(i-1, buf, src, tar)
}

/* ハノイの塔の問題を解く */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// A の上から n 枚の円盤を、B を使って C に移す
	dfsHanota(n, A, B, C)
}
