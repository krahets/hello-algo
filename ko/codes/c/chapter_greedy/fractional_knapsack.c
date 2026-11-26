/**
 * File: fractional_knapsack.c
 * Created Time: 2023-09-14
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 물건 */
typedef struct {
    int w; // 물건의 무게
    int v; // 물건의 가치
} Item;

/* 단위 무게당 가치를 기준으로 정렬한다 */
int sortByValueDensity(const void *a, const void *b) {
    Item *t1 = (Item *)a;
    Item *t2 = (Item *)b;
    return (float)(t1->v) / t1->w < (float)(t2->v) / t2->w;
}

/* 탐욕 알고리즘으로 분할 가능 배낭 풀기 */
float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
    // 무게와 가치를 속성으로 갖는 물건의 리스트를 만든다
    Item *items = malloc(sizeof(Item) * itemCount);
    for (int i = 0; i < itemCount; i++) {
        items[i] = (Item){.w = wgt[i], .v = val[i]};
    }
    // 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
    // 탐욕 선택을 반복한다
    float res = 0.0;
    for (int i = 0; i < itemCount; i++) {
        if (items[i].w <= cap) {
            // 남은 용량이 충분하면 현재 물건을 통째로 배낭에 담는다
            res += items[i].v;
            cap -= items[i].w;
        } else {
            // 남은 용량이 부족하면 현재 물건의 일부만 배낭에 담는다
            res += (float)cap / items[i].w * items[i].v;
            cap = 0;
            break;
        }
    }
    free(items);
    return res;
}

/* 실행 예제 */
int main(void) {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int capacity = 50;

    // 탐욕 알고리즘
    float res = fractionalKnapsack(wgt, val, sizeof(wgt) / sizeof(int), capacity);
    printf("배낭 용량 안에서 얻는 최대 가치: %0.2f\n", res);

    return 0;
}
