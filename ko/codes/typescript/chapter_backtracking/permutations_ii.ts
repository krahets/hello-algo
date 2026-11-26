/**
 * File: permutations_ii.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 백트래킹: 순열 II */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // 모든 선택지를 순회한다
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
        if (!selected[i] && !duplicated.has(choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            duplicated.add(choice); // 선택한 원소의 값을 기록한다
            selected[i] = true;
            state.push(choice);
            // 다음 선택을 진행한다
            backtrack(state, choices, selected, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            selected[i] = false;
            state.pop();
        }
    });
}

/* 순열 II */
function permutationsII(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// 실행 코드
const nums: number[] = [1, 2, 2];
const res: number[][] = permutationsII(nums);

console.log(`입력 배열 nums = ${JSON.stringify(nums)}`);
console.log(`모든 순열 res = ${JSON.stringify(res)}`);

export {};
