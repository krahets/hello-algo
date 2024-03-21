// File: hanota.go
// Created Time: 2023-07-21
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import "container/list"

/* 移动一个圆盘 */
func move(src, tar *list.List) {
	// 从 src 顶部拿出一个圆盘
	pan := src.Back()
	// 将圆盘放入 tar 顶部
	tar.PushBack(pan.Value)
	// 移除 src 顶部圆盘
	src.Remove(pan)
}

/* 求解汉诺塔问题 f(i) */
func dfsHanota(i int, src, buf, tar *list.List) {
	// 若 src 只剩下一个圆盘，则直接将其移到 tar
	if i == 1 {
		move(src, tar)
		return
	}
	// 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
	dfsHanota(i-1, src, tar, buf)
	// 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
	move(src, tar)
	// 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
	dfsHanota(i-1, buf, src, tar)
}

/* 求解汉诺塔问题 */
func solveHanota(A, B, C *list.List) {
	n := A.Len()
	// 将 A 顶部 n 个圆盘借助 B 移到 C
	dfsHanota(n, A, B, C)
}
