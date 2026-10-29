/**
 * File: permutations_i.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキング：すべての順列 I */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査する
    choices.forEach((choice, i) => {
        // 枝刈り：同じ要素を繰り返し選んではならない
        if (!selected[i]) {
            // 試行：選択を行い、状態を更新する
            selected[i] = true;
            state.push(choice);
            // 次の選択に進む
            backtrack(state, choices, selected, res);
            // 復元：選択を取り消し、以前の状態に戻す
            selected[i] = false;
            state.pop();
        }
    });
}

/* すべての順列 I */
function permutationsI(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// 実行用コード
const nums: number[] = [1, 2, 3];
const res: number[][] = permutationsI(nums);

console.log(`入力配列 nums = ${JSON.stringify(nums)}`);
console.log(`すべての順列 res = ${JSON.stringify(res)}`);

export {};
