/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯演算法：全排列 I */
function backtrack(state, choices, selected, res) {
    // 當狀態長度等於元素個數時，記錄此解
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // 逐一檢查所有選項
    choices.forEach((choice, i) => {
        // 剪枝：不可重複選取同一個元素
        if (!selected[i]) {
            // 嘗試：做出選擇並更新狀態
            selected[i] = true;
            state.push(choice);
            // 進入下一輪選擇
            backtrack(state, choices, selected, res);
            // 回溯：撤銷選擇，還原先前的狀態
            selected[i] = false;
            state.pop();
        }
    });
}

/* 全排列 I */
function permutationsI(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// 主程式
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`輸入陣列 nums = ${JSON.stringify(nums)}`);
console.log(`所有排列 res = ${JSON.stringify(res)}`);
