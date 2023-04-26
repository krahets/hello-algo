/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: Krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯算法：全排列 I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 当状态长度等于元素数量时，记录解
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        if (!selected[i]) {
            // 尝试
            selected[i] = true;      // 做出选择
            state.push_back(choice); // 更新状态
            backtrack(state, choices, selected, res);
            // 回退
            selected[i] = false; // 撤销选择
            state.pop_back();    // 恢复到之前的状态
        }
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 2, 3};

    // 回溯算法
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);

    cout << "输入数组 nums = ";
    printVector(nums);
    cout << "所有排列 res = ";
    printVectorMatrix(res);

    return 0;
}
