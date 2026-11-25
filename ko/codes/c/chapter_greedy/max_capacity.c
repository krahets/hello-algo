/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* 최솟값 구하기 */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* 최댓값 구하기 */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 탐욕 알고리즘으로 최대 용량 구하기 */
int maxCapacity(int ht[], int htLength) {
    // i와 j를 각각 배열의 양 끝에 놓는다
    int i = 0;
    int j = htLength - 1;
    // 최대 용량의 초깃값은 0이다
    int res = 0;
    // 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* 실행 예제 */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // 탐욕 알고리즘
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("최대 용량: %d\n", res);

    return 0;
}
