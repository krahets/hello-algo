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

/* Sort by value per unit of weight */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* Greedy fractional knapsack */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // Create a list of items, each with a weight and a value
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // Sort by value per unit of weight, item.v / item.w, in descending order
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // Make greedy choices in a loop
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // If the whole item fits, put it in the knapsack
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // If the whole item does not fit, take a fraction of it
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* Driver code */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // Greedy algorithm
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("The maximum total value within the weight limit is %0.2f\n", res);

    return 0;
}
