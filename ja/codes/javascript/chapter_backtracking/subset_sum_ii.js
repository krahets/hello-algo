/**
 * File: subset_sum_ii.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキング：部分集合和 II */
function backtrack(state, target, choices, start, res) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査する
    // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    // 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
    for (let i = start; i < choices.length; i++) {
        // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
        if (target - choices[i] < 0) {
            break;
        }
        // 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // 試行：選択を行い、target, start を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop();
    }
}

/* 部分集合和 II を解く */
function subsetSumII(nums, target) {
    const state = []; // 状態（部分集合）
    nums.sort((a, b) => a - b); // nums をソートする
    const start = 0; // 走査の開始位置
    const res = []; // 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 実行用コード */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`和が ${target} になるすべての部分集合 res = ${JSON.stringify(res)}`);
