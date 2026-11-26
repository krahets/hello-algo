/**
 * File: coin_change_greedy.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 탐욕 알고리즘으로 거스름돈 만들기 */
function coinChangeGreedy(coins, amt) {
    // coins 배열은 오름차순으로 정렬되어 있다고 가정한다
    let i = coins.length - 1;
    let count = 0;
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
    return amt === 0 ? count : -1;
}

/* 실행 예제 */
// 탐욕 선택이 전역 최적해를 보장하는 경우
let coins = [1, 5, 10, 20, 50, 100];
let amt = 186;
let res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`목표 금액 ${amt}, 필요한 최소 동전 수: ${res}`);

// 탐욕 선택이 전역 최적해를 보장하지 않는 경우
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`목표 금액 ${amt}, 필요한 최소 동전 수: ${res}`);
console.log('실제로는 20 + 20 + 20으로 최소 3개가 필요하다');

// 탐욕 선택이 전역 최적해를 보장하지 않는 경우
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`목표 금액 ${amt}, 필요한 최소 동전 수: ${res}`);
console.log('실제로는 49 + 49로 최소 2개가 필요하다');
