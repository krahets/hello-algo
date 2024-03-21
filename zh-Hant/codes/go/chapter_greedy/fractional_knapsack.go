// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* 物品 */
type Item struct {
	w int // 物品重量
	v int // 物品價值
}

/* 分數背包：貪婪 */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// 建立物品串列，包含兩個屬性：重量、價值
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// 按照單位價值 item.v / item.w 從高到低進行排序
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// 迴圈貪婪選擇
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// 若剩餘容量充足，則將當前物品整個裝進背包
			res += float64(item.v)
			cap -= item.w
		} else {
			// 若剩餘容量不足，則將當前物品的一部分裝進背包
			res += float64(item.v) / float64(item.w) * float64(cap)
			// 已無剩餘容量，因此跳出迴圈
			break
		}
	}
	return res
}
