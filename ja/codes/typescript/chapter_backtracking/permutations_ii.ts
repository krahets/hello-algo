/**
 * File: permutations_ii.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキング：順列 II */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // 状態の長さが要素数に等しければ、解を記録
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // 枝刈り：要素の重複選択を許可せず、同値要素の重複選択も許可しない
        if (!selected[i] && !duplicated.has(choice)) {
            // 試行: 選択を行い、状態を更新
            duplicated.add(choice); // 選択済みの要素値を記録
            selected[i] = true;
            state.push(choice);
            // 次の選択へ進む
            backtrack(state, choices, selected, res);
            // バックトラック：選択を取り消し、前の状態に戻す
            selected[i] = false;
            state.pop();
        }
    });
}

/* 全順列 II */
function permutationsII(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums: number[] = [1, 2, 2];
const res: number[][] = permutationsII(nums);

console.log(`入力配列 nums = ${JSON.stringify(nums)}`);
console.log(`すべての順列 res = ${JSON.stringify(res)}`);

export {};
