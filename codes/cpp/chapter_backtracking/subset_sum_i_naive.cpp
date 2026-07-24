/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 打印一维数组 */
void printVector(const vector<int>& vec) {
    cout << "[ ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << "]" << endl;
}

/* 打印二维数组 */
void printVectorMatrix(const vector<vector<int>>& mat) {
    cout << "[" << endl;
    for (const auto& row : mat) {
        cout << "  ";
        printVector(row);
    }
    cout << "]" << endl;
}

/* 回溯算法：子集和 I（暴力版，会产生重复子集） */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 子集和等于 target 时，记录解
    if (total == target) {
        res.push_back(state);
        return;
    }
    // 遍历所有选择
    for (size_t i = 0; i < choices.size(); i++) {
        // 剪枝：若子集和超过 target，则跳过
        if (total + choices[i] > target) {
            continue;
        }
        // 尝试：做出选择
        state.push_back(choices[i]);
        // 下一轮选择
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤销选择
        state.pop_back();
    }
}

/* 求解子集和 I（包含重复子集） */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;
    int total = 0;
    vector<vector<int>> res;
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "输入数组 nums = ";
    printVector(nums);
    cout << "目标和 target = " << target << endl;
    cout << "所有和为 " << target << " 的子集（含重复）：" << endl;
    printVectorMatrix(res);

    return 0;
}
