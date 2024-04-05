/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：全排列 I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 當狀態長度等於元素數量時，記錄解
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // 走訪所有選擇
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 剪枝：不允許重複選擇元素
        if (!selected[i]) {
            // 嘗試：做出選擇，更新狀態
            selected[i] = true;
            state.push_back(choice);
            // 進行下一輪選擇
            backtrack(state, choices, selected, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* 全排列 I */
vector<vector<int>> permutationsI(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 2, 3};

    vector<vector<int>> res = permutationsI(nums);

    cout << "輸入陣列 nums = ";
    printVector(nums);
    cout << "所有排列 res = ";
    printVectorMatrix(res);

    return 0;
}
