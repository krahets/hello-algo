/**
 * File: subset_sum_i.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯演算法：子集和 I */
function backtrack(state, target, choices, start, res) {
    // 子集和等於 target 時，記錄解
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // 走訪所有選擇
    // 剪枝二：從 start 開始走訪，避免生成重複子集
    for (let i = start; i < choices.length; i++) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if (target - choices[i] < 0) {
            break;
        }
        // 嘗試：做出選擇，更新 target, start
        state.push(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.pop();
    }
}

/* 求解子集和 I */
function subsetSumI(nums, target) {
    const state = []; // 狀態（子集）
    nums.sort((a, b) => a - b); // 對 nums 進行排序
    const start = 0; // 走訪起始點
    const res = []; // 結果串列（子集串列）
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`輸入陣列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`所有和等於 ${target} 的子集 res = ${JSON.stringify(res)}`);
