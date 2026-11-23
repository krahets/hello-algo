// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* 물건 */
type Item struct {
	w int // 물건의 무게
	v int // 물건의 가치
}

/* 분할 가능한 배낭: 탐욕 */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// 탐욕적 선택을 반복한다
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
			res += float64(item.v)
			cap -= item.w
		} else {
			// 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
			res += float64(item.v) / float64(item.w) * float64(cap)
			// 남은 용량이 없으므로 반복문을 종료한다
			break
		}
	}
	return res
}
