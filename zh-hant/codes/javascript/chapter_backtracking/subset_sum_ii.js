/**
 * File: subset_sum_ii.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯演算法：子集和 II */
function backtrack(state, target, choices, start, res) {
    // 子集總和達到目標時，記錄此解
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
    for (let i = start; i < choices.length; i++) {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if (target - choices[i] < 0) {
            break;
        }
        // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // 嘗試：做出選擇，更新 target 和 start
        state.push(choices[i]);
        // 進入下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 回溯：撤銷選擇，還原先前的狀態
        state.pop();
    }
}

/* 求解子集和 II */
function subsetSumII(nums, target) {
    const state = []; // 狀態（子集）
    nums.sort((a, b) => a - b); // 將 nums 排序
    const start = 0; // 走訪的起點
    const res = []; // 結果串列（子集串列）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 主程式 */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`輸入陣列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`總和等於 ${target} 的所有子集 res = ${JSON.stringify(res)}`);
