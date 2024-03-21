/**
 * File: permutations_ii.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯演算法：全排列 II */
function backtrack(state, choices, selected, res) {
    // 當狀態長度等於元素數量時，記錄解
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // 走訪所有選擇
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // 剪枝：不允許重複選擇元素 且 不允許重複選擇相等元素
        if (!selected[i] && !duplicated.has(choice)) {
            // 嘗試：做出選擇，更新狀態
            duplicated.add(choice); // 記錄選擇過的元素值
            selected[i] = true;
            state.push(choice);
            // 進行下一輪選擇
            backtrack(state, choices, selected, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            selected[i] = false;
            state.pop();
        }
    });
}

/* 全排列 II */
function permutationsII(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums = [1, 2, 2];
const res = permutationsII(nums);

console.log(`輸入陣列 nums = ${JSON.stringify(nums)}`);
console.log(`所有排列 res = ${JSON.stringify(res)}`);
