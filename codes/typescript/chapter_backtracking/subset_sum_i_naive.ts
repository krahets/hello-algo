/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯算法：子集和 I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // 子集和等于 target 时，记录解
    if (total === target) {
        res.push([...state]);
        return;
    }
    // 遍历所有选择
    for (let i = 0; i < choices.length; i++) {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if (total + choices[i] > target) {
            continue;
        }
        // 尝试：做出选择，更新元素和 total
        state.push(choices[i]);
        // 进行下一轮选择
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤销选择，恢复到之前的状态
        state.pop();
    }
}

/* 求解子集和 I（包含重复子集） */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // 状态（子集）
    const total = 0; // 子集和
    const res = []; // 结果列表（子集列表）
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`输入数组 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`所有和等于 ${target} 的子集 res = ${JSON.stringify(res)}`);
console.log('请注意，该方法输出的结果包含重复集合');

export {};
