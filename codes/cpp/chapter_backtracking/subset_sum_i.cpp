/**
 * File: subset_sum_i.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

/* 打印一维数组 */
void printVector(const vector<int>& vec) {
    cout << "[ ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << "]" << endl;
}

/* 打印二维数组（子集结果） */
void printVectorMatrix(const vector<vector<int>>& mat) {
    cout << "[" << endl;
    for (const auto& row : mat) {
        cout << "  ";
        printVector(row);
    }
    cout << "]" << endl;
}

/* 回溯算法：子集和 I（元素可重复选取） */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 子集和等于 target 时，记录解
    if (target == 0) {
        res.push_back(state);
        return;
    }

    // 遍历所有选择
    for (int i = start; i < choices.size(); i++) {
        // 剪枝：若子集和超过 target，直接退出（数组已排序）
        if (target - choices[i] < 0) {
            break;
        }

        // 尝试：做出选择
        state.push_back(choices[i]);

        // 下一轮：仍从 i 开始 → 可重复选当前元素
        backtrack(state, target - choices[i], choices, i, res);

        // 回退：撤销选择
        state.pop_back();
    }
}

/* 求解子集和 I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;
    sort(nums.begin(), nums.end()); // 排序，用于剪枝
    int start = 0;
    vector<vector<int>> res;
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "输入数组 nums = ";
    printVector(nums);
    cout << "目标和 target = " << target << endl;
    cout << "所有和为 " << target << " 的子集：" << endl;
    printVectorMatrix(res);

    return 0;
}
