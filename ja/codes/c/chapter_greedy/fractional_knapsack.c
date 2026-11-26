/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 品物 */
typedef struct {
    int w; // 品物の重さ
    int v; // 品物の価値
} Item;

/* 単位重量あたりの価値でソートする */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 分割可能ナップサック（貪欲法） */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 重さと価値の 2 つの属性を持つ品物のリストを作る
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 単位重量あたりの価値 item.v / item.w の降順にソートする
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 貪欲選択を繰り返す
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごと入れる
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 残り容量が足りなければ、現在の品物の一部を入れる
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* 実行例 */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // 貪欲法
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("容量内で得られる品物の合計価値の最大値は %0.2f\n", res);

    return 0;
}
