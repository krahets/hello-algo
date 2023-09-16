/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 物品 */
typedef struct Item {
	int w; // 物品重量
	int v; // 物品价值
} Item;

/* 按照价值密度排序 */
int sortByValueDensity(const void *a, const void *b) {
	Item *t1 = (Item *)a;
	Item *t2 = (Item *)b;
	return (float)(t1->v)/t1->w < (float)(t2->v)/t2->w;
}

/* 分数背包：贪心 */
float fractionalKnapsack(Item items[], int itemCount, int cap) {
	// 按照单位价值 item.v / item.w 从高到低进行排序
	// sortByValueDensity(items, itemCount);
	qsort(items, (size_t)itemCount, sizeof(struct Item), sortByValueDensity);

	// 循环贪心选择
	float res = .0;
	for (int i = 0; i < itemCount; i++) {
		if(items[i].w <= cap) {
			// 若剩余容量充足，则将当前物品整个装进背包
			res += items[i].v;
			cap -= items[i].w;
		} else {
			// 若剩余容量不足，则将当前物品的一部分装进背包
			res += (float)cap/items[i].w*items[i].v;
			cap = 0;
			break;
		}
	}
	return res;
}

int main(void) {
	Item items[] = {
		{10, 50},
		{20, 120},
		{30, 150},
		{40, 210},
		{50, 240}
	};
	int capacity = 50;

	// 贪心算法
	float res = fractionalKnapsack(items, sizeof(items)/sizeof(Item), capacity);
	printf("不超过背包容量的最大物品价值为 %0.2f\n", res);

	return 0;
}
