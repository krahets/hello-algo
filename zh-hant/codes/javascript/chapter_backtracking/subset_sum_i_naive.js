/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯演算法：子集和 I */
function backtrack(state, target, total, choices, res) {
    // 子集總和達到目標時，記錄此解
    if (total === target) {
        res.push([...state]);
        return;
    }
    // 逐一檢查所有選項
    for (let i = 0; i < choices.length; i++) {
        // 剪枝：若加入該元素後總和超過 target，略過這個選擇
        if (total + choices[i] > target) {
            continue;
        }
        // 嘗試：做出選擇，更新元素總和 total
        state.push(choices[i]);
        // 進入下一輪選擇
        backtrack(state, target, total + choices[i], choices, res);
        // 回溯：撤銷選擇，還原先前的狀態
        state.pop();
    }
}

/* 求解子集和 I（含重複子集） */
function subsetSumINaive(nums, target) {
    const state = []; // 狀態（子集）
    const total = 0; // 子集總和
    const res = []; // 結果串列（子集串列）
    backtrack(state, target, total, nums, res);
    return res;
}

/* 主程式 */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`輸入陣列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`總和等於 ${target} 的所有子集 res = ${JSON.stringify(res)}`);
console.log('請注意，這個方法輸出的結果含有重複集合');
