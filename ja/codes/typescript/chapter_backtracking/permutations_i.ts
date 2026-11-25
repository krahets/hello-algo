/**
 * File: permutations_i.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキングによる全順列 I */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // 状態の長さが要素数に達したら解を記録する
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を調べる
    choices.forEach((choice, i) => {
        // 枝刈り：同じ要素は二度選ばない
        if (!selected[i]) {
            // 試行：選択して状態を更新する
            selected[i] = true;
            state.push(choice);
            // 次の選択に進む
            backtrack(state, choices, selected, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = false;
            state.pop();
        }
    });
}

/* 全順列 I */
function permutationsI(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// 実行例
const nums: number[] = [1, 2, 3];
const res: number[][] = permutationsI(nums);

console.log(`入力配列 nums = ${JSON.stringify(nums)}`);
console.log(`すべての順列 res = ${JSON.stringify(res)}`);

export {};
