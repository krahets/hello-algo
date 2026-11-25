/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：子集和 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 子集總和達到目標時，記錄此解
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    for (int i = start; i < choices.size(); i++) {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if (target - choices[i] < 0) {
            break;
        }
        // 嘗試：做出選擇，更新 target 和 start
        state.push_back(choices[i]);
        // 進入下一輪選擇
        backtrack(state, target - choices[i], choices, i, res);
        // 回溯：撤銷選擇，還原先前的狀態
        state.pop_back();
    }
}

/* 求解子集和 I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // 狀態（子集）
    sort(nums.begin(), nums.end()); // 將 nums 排序
    int start = 0;                  // 走訪的起點
    vector<vector<int>> res;        // 結果串列（子集串列）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 主程式 */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "輸入陣列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "所有總和等於 " << target << " 的子集 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
