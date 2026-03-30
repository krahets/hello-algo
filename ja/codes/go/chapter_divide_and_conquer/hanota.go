// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 円盤を 1 枚移動 */
func move(src, tar *list.List) {
	// src の上から円盤を1枚取り出す
	pan := src.Back()
	// 円盤を tar の上に置く
	tar.PushBack(pan.Value)
	// `src` の最上部の円盤を取り外す
	src.Remove(pan)
}

/* ハノイの塔の問題 f(i) を解く */
func dfsHanota(i int, src, buf, tar *list.List) {
	// src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
	if i == 1 {
		move(src, tar)
		return
	}
	// 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
	dfsHanota(i-1, src, tar, buf)
	// 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
	move(src, tar)
	// 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
	dfsHanota(i-1, buf, src, tar)
}

/* ハノイの塔を解く */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// A の上から n 枚の円盤を B を介して C へ移す
	dfsHanota(n, A, B, C)
}
