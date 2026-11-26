/**
 * File: subset_sum_i.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキングによる部分和問題 I */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を調べる
    // 枝刈り 2：start から調べて部分集合の重複を防ぐ
    for (let i = start; i < choices.length; i++) {
        // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
        // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break;
        }
        // 試行：選択して target と start を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i, res);
        // 後戻り：選択を取り消し、元の状態に戻す
        state.pop();
    }
}

/* 部分和問題 I を解く */
function subsetSumI(nums: number[], target: number): number[][] {
    const state = []; // 状態（部分集合）
    nums.sort((a, b) => a - b); // nums をソートする
    const start = 0; // 走査の開始位置
    const res = []; // 結果のリスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 実行例 */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`要素の和が ${target} となるすべての部分集合 res = ${JSON.stringify(res)}`);

export {};
