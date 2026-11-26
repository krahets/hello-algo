// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for ループ */
func forLoop(n int) int {
	res := 0
	// 1, 2, ..., n-1, n の和をループで求める
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while ループ */
func whileLoop(n int) int {
	res := 0
	// 条件判定用の変数を初期化
	i := 1
	// 1, 2, ..., n-1, n の和をループで求める
	for i <= n {
		res += i
		// 条件判定用の変数を更新
		i++
	}
	return res
}

/* while ループ（2 回更新） */
func whileLoopII(n int) int {
	res := 0
	// 条件判定用の変数を初期化
	i := 1
	// 1, 4, 10, ... の和をループで求める
	for i <= n {
		res += i
		// 条件判定用の変数を更新
		i++
		i *= 2
	}
	return res
}

/* 二重の for ループ */
func nestedForLoop(n int) string {
	res := ""
	// i = 1, 2, ..., n-1, n の順に繰り返す
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// j = 1, 2, ..., n-1, n の順に繰り返す
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
