/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 탐욕 알고리즘으로 거스름돈 만들기 */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // coins 리스트는 오름차순으로 정렬되어 있다고 가정한다
    int i = coins.size() - 1;
    int count = 0;
    // 남은 금액이 없어질 때까지 탐욕 선택을 반복한다
    while (amt > 0) {
        // 남은 금액을 넘지 않는 가장 큰 액면가의 동전을 찾는다
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i] 선택
        amt -= coins[i];
        count++;
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return amt == 0 ? count : -1;
}

/* 실행 예제 */
int main() {
    // 탐욕 선택이 전역 최적해를 보장하는 경우
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "목표 금액 " << amt << " 달성에 필요한 최소 동전 수: " << res << endl;

    // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "목표 금액 " << amt << " 달성에 필요한 최소 동전 수: " << res << endl;
    cout << "실제로는 20 + 20 + 20으로 최소 3개가 필요하다" << endl;

    // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "목표 금액 " << amt << " 달성에 필요한 최소 동전 수: " << res << endl;
    cout << "실제로는 49 + 49로 최소 2개가 필요하다" << endl;

    return 0;
}
