/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Item */
typedef struct {
    int w; // Item weight
    int v; // Item value
} Item;

/* Sort by value density */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* Fractional knapsack: Greedy algorithm */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // Create item list with two attributes: weight, value
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // Sort by unit value item.v / item.w from high to low
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // Loop for greedy selection
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // If remaining capacity is sufficient, put the entire current item into the knapsack
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // If remaining capacity is insufficient, put part of the current item into the knapsack
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

    // Greedy algorithm
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("Maximum item value not exceeding knapsack capacity is %0.2f\n", res);

    return 0;
}
