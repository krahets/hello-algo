/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* 동전 교환: 탐욕 */
int coinChangeGreedy(int *coins, int size, int amt) {
    // coins 리스트가 정렬되어 있다고 가정한다
    int i = size - 1;
    int count = 0;
    // 남은 금액이 없을 때까지 탐욕적 선택을 반복한다
    while (amt > 0) {
        // 남은 금액보다 작으면서 가장 가까운 금액의 동전을 찾는다
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i]를 선택한다
        amt -= coins[i];
        count++;
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return amt == 0 ? count : -1;
}

/* 실행 코드 */
int main() {
    // 탐욕: 전역 최적해를 찾는 것이 보장된다
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res);

    // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res);
    printf("실제 최소 개수는 3이며, 20 + 20 + 20으로 만들 수 있다\n");

    // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res);
    printf("실제 최소 개수는 2이며, 49 + 49로 만들 수 있다\n");

    return 0;
}
