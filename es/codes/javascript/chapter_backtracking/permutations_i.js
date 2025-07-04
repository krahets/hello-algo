/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯算法：全排列 I */
function backtrack(state, choices, selected, res) {
    // 当状态长度等于元素数量时，记录解
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // 遍历所有选择
    choices.forEach((choice, i) => {
        // 剪枝：不允许重复选择元素
        if (!selected[i]) {
            // 尝试：做出选择，更新状态
            selected[i] = true;
            state.push(choice);
            // 进行下一轮选择
            backtrack(state, choices, selected, res);
            // 回退：撤销选择，恢复到之前的状态
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

// Driver Code
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`输入数组 nums = ${JSON.stringify(nums)}`);
console.log(`所有排列 res = ${JSON.stringify(res)}`);
