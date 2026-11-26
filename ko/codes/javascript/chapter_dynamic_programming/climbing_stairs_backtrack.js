/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 백트래킹 */
function backtrack(choices, state, n, res) {
    // n번째 계단에 도달하면 방법 수를 1 늘린다
    if (state === n) res.set(0, res.get(0) + 1);
    // 모든 선택지 순회
    for (const choice of choices) {
        // 가지치기: n번째 계단을 넘지 않는다
        if (state + choice > n) continue;
        // 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 선택 취소
    }
}

/* 계단 오르기: 백트래킹 */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // 한 번에 한 계단 또는 두 계단을 오른다
    const state = 0; // 0번째 계단에서 출발한다
    const res = new Map();
    res.set(0, 0); // res[0]에 방법 수를 기록한다
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* 실행 예제 */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`계단 ${n}개를 오르는 방법은 ${res}가지`);
