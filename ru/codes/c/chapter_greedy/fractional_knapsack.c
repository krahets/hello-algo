/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Предмет */
typedef struct {
    int w; // Вес предмета
    int v; // Стоимость предмета
} Item;

/* Сортируем по стоимости единицы веса */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* Дробный рюкзак: жадный алгоритм */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // Сортируем по убыванию удельной стоимости item.v / item.w
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // На каждом шаге делаем жадный выбор
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // Если места достаточно, кладём предмет целиком
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // Если места недостаточно, кладём часть предмета
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* Пример запуска */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // Жадный алгоритм
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("Максимальная стоимость при заданной вместимости рюкзака: %0.2f\n", res);

    return 0;
}
