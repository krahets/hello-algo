/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 物品 */
typedef struct {
    int w; // 物品重量
    int v; // 物品价值
} Item;

/* 按照价值密度排序 */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 分数背包：贪心 */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 创建物品列表，包含两个属性：重量、价值
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 按照单位价值 item.v / item.w 从高到低进行排序
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 循环贪心选择
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 若剩余容量充足，则将当前物品整个装进背包
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 若剩余容量不足，则将当前物品的一部分装进背包
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* Driver Code */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // 贪心算法
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("不超过背包容量的最大物品价值为 %0.2f\n", res);

    return 0;
}
