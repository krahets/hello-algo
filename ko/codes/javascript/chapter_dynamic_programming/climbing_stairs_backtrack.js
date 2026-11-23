/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 백트래킹 */
function backtrack(choices, state, n, res) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if (state === n) res.set(0, res.get(0) + 1);
    // 모든 선택지를 순회한다
    for (const choice of choices) {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if (state + choice > n) continue;
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    const state = 0; // 0번째 계단에서 오르기 시작한다
    const res = new Map();
    res.set(0, 0); // res[0]에 방법의 수를 기록한다
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* 실행 코드 */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`${n}개의 계단을 오르는 방법은 총 ${res}가지이다`);
