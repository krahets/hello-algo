// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 移動一個圓盤 */
func move(src, tar *list.List) {
	// 從 src 頂端取出一個圓盤
	pan := src.Back()
	// 將圓盤放到 tar 頂端
	tar.PushBack(pan.Value)
	// 取下 src 頂端的圓盤
	src.Remove(pan)
}

/* 求解河內塔問題 f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// 若 src 只剩一個圓盤，直接將它移到 tar
	if i == 1 {
		move(src, tar)
		return
	}
	// 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
	dfsHanota(i-1, src, tar, buf)
	// 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
	move(src, tar)
	// 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
	dfsHanota(i-1, buf, src, tar)
}

/* 求解河內塔問題 */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// 藉助 B，將 A 頂端的 n 個圓盤移到 C
	dfsHanota(n, A, B, C)
}
