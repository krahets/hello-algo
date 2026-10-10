// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* 品物 */
type Item struct {
	w int // 品物の重さ
	v int // 品物の価値
}

/* 分数ナップサック：貪欲法 */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// 重さと価値の 2 属性を持つ品物リストを作成
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// 単位価値 item.v / item.w の高い順にソートする
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// 貪欲選択を繰り返す
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
			res += float64(item.v)
			cap -= item.w
		} else {
			// 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
			res += float64(item.v) / float64(item.w) * float64(cap)
			// 残り容量がないため、ループを抜ける
			break
		}
	}
	return res
}
