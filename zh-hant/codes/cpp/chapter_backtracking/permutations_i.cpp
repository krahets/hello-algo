/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：全排列 I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 當狀態長度等於元素個數時，記錄此解
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // 逐一檢查所有選項
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 剪枝：不可重複選取同一個元素
        if (!selected[i]) {
            // 嘗試：做出選擇並更新狀態
            selected[i] = true;
            state.push_back(choice);
            // 進入下一輪選擇
            backtrack(state, choices, selected, res);
            // 回溯：撤銷選擇，還原先前的狀態
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

/* 主程式 */
int main() {
    vector<int> nums = {1, 2, 3};

    vector<vector<int>> res = permutationsI(nums);

    cout << "輸入陣列 nums = ";
    printVector(nums);
    cout << "所有排列 res = ";
    printVectorMatrix(res);

    return 0;
}
