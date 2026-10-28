/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 백트래킹 알고리즘: 부분 집합 합 I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (total === target) {
        res.push([...state]);
        return;
    }
    // 모든 선택지를 순회한다
    for (let i = 0; i < choices.length; i++) {
        // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        if (total + choices[i] > target) {
            continue;
        }
        // 시도: 선택하고 원소의 합 total을 갱신한다
        state.push(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop();
    }
}

/* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // 상태(부분 집합)
    const total = 0; // 부분 집합의 합
    const res = []; // 결과 리스트(부분 집합 리스트)
    backtrack(state, target, total, nums, res);
    return res;
}

/* 실행 코드 */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`입력 배열 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`합이 ${target}인 모든 부분 집합 res = ${JSON.stringify(res)}`);
console.log('이 방법의 출력 결과에는 중복 집합이 포함된다');

export {};
