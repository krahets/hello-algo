/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキング：部分集合和 I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // 部分集合の和が target と等しくなったら、解を記録する
    if (total === target) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査する
    for (let i = 0; i < choices.length; i++) {
        // 枝刈り：部分集合の和が target を超える場合、この選択をスキップする
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素の和 total を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop();
    }
}

/* 部分集合和 I を解く（重複した部分集合を含む） */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // 状態（部分集合）
    const total = 0; // 部分集合和
    const res = []; // 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* 実行用コード */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`和が ${target} になるすべての部分集合 res = ${JSON.stringify(res)}`);
console.log('この方法の出力結果には重複した集合が含まれることに注意');

export {};
