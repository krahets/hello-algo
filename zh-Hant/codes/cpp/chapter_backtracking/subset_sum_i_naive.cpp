/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：子集和 I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 子集和等於 target 時，記錄解
    if (total == target) {
        res.push_back(state);
        return;
    }
    // 走訪所有選擇
    for (size_t i = 0; i < choices.size(); i++) {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if (total + choices[i] > target) {
            continue;
        }
        // 嘗試：做出選擇，更新元素和 total
        state.push_back(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.pop_back();
    }
}

/* 求解子集和 I（包含重複子集） */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // 狀態（子集）
    int total = 0;           // 子集和
    vector<vector<int>> res; // 結果串列（子集串列）
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "輸入陣列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "所有和等於 " << target << " 的子集 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
