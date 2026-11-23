/**
 * File: subset_sum_i.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 백트래킹 알고리즘: 부분 집합 합 I */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
    for (let i = start; i < choices.length; i++) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
            break;
        }
        // 시도: 선택하고 target, start를 갱신한다
        state.push(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop();
    }
}

/* 부분 집합 합 I 풀기 */
function subsetSumI(nums: number[], target: number): number[][] {
    const state = []; // 상태(부분 집합)
    nums.sort((a, b) => a - b); // nums를 정렬한다
    const start = 0; // 순회 시작 위치
    const res = []; // 결과 리스트(부분 집합 리스트)
    backtrack(state, target, nums, start, res);
    return res;
}

/* 실행 코드 */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`입력 배열 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`합이 ${target}인 모든 부분 집합 res = ${JSON.stringify(res)}`);

export {};
