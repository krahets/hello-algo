/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 物品 */
typedef struct {
    int w; // 物品重量
    int v; // 物品價值
} Item;

/* 依價值密度排序 */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 分數背包：貪婪法 */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 依單位價值 item.v / item.w 由高到低排序
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 反覆依貪婪策略選取物品
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* 主程式 */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // 貪婪演算法
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("在背包容量限制內，物品的最大總價值為 %0.2f\n", res);

    return 0;
}
