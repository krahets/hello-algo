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

/* 価値密度でソート */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 分数ナップサック：貪欲法 */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 重さと価値の 2 属性を持つ品物リストを作成
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 単位価値 item.v / item.w の高い順にソートする
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 貪欲選択を繰り返す
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
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

    // 貪欲法
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("ナップサック容量を超えない最大の品物価値は %0.2f です\n", res);

    return 0;
}
