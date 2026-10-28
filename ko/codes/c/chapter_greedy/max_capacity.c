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

/* 최대 용량: 탐욕 */
int maxCapacity(int ht[], int htLength) {
    // i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    int i = 0;
    int j = htLength - 1;
    // 최대 용량의 초깃값은 0이다
    int res = 0;
    // 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while (i < j) {
        // 최대 용량을 갱신한다
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // 낮은 칸막이를 안쪽으로 이동한다
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* 실행 코드 */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // 탐욕 알고리즘
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("최대 용량은 %d이다\n", res);

    return 0;
}
