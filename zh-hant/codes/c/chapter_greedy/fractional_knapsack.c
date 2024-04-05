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

/* 按照價值密度排序 */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 分數背包：貪婪 */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 建立物品串列，包含兩個屬性：重量、價值
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 按照單位價值 item.v / item.w 從高到低進行排序
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 迴圈貪婪選擇
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
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

    // 貪婪演算法
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("不超過背包容量的最大物品價值為 %0.2f\n", res);

    return 0;
}
