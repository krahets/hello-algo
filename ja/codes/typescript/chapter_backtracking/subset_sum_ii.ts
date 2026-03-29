/**
 * File: subset_sum_ii.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキング：部分和 II */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // 部分集合の和が target に等しければ、解を記録
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    // 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
    for (let i = start; i < choices.length; i++) {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break;
        }
        // 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // 試す：選択を行い、target と start を更新
        state.push(choices[i]);
        // 次の選択へ進む
        backtrack(state, target - choices[i], choices, i + 1, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop();
    }
}

/* 部分和 II を解く */
function subsetSumII(nums: number[], target: number): number[][] {
    const state = []; // 状態（部分集合）
    nums.sort((a, b) => a - b); // nums をソート
    const start = 0; // 開始点を走査
    const res = []; // 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`合計が ${target} に等しいすべての部分集合 res = ${JSON.stringify(res)}`);

export {};
