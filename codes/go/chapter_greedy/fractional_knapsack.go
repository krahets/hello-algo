// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* 物品 */
type Item struct {
	w int // 物品重量
	v int // 物品价值
}

/* 分数背包：贪心 */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// 创建物品列表，包含两个属性：重量、价值
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// 按照单位价值 item.v / item.w 从高到低进行排序
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// 循环贪心选择
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// 若剩余容量充足，则将当前物品整个装进背包
			res += float64(item.v)
			cap -= item.w
		} else {
			// 若剩余容量不足，则将当前物品的一部分装进背包
			res += float64(item.v) / float64(item.w) * float64(cap)
			// 已无剩余容量，因此跳出循环
			break
		}
	}
	return res
}
