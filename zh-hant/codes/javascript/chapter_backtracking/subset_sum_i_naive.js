/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯演算法：子集和 I */
function backtrack(state, target, total, choices, res) {
    // 子集和等於 target 時，記錄解
    if (total === target) {
        res.push([...state]);
        return;
    }
    // 走訪所有選擇
    for (let i = 0; i < choices.length; i++) {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if (total + choices[i] > target) {
            continue;
        }
        // 嘗試：做出選擇，更新元素和 total
        state.push(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.pop();
    }
}

/* 求解子集和 I（包含重複子集） */
function subsetSumINaive(nums, target) {
    const state = []; // 狀態（子集）
    const total = 0; // 子集和
    const res = []; // 結果串列（子集串列）
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`輸入陣列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`所有和等於 ${target} 的子集 res = ${JSON.stringify(res)}`);
console.log('請注意，該方法輸出的結果包含重複集合');
