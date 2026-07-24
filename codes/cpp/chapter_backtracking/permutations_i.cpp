/**
 * File: permutations_i.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 打印一维数组 */
void printVector(const vector<int>& vec) {
    cout << "[ ";
    for (size_t i = 0; i < vec.size(); i++) {
        cout << vec[i] << " ";
    }
    cout << "]" << endl;
}

/* 打印二维数组（所有排列） */
void printVectorMatrix(const vector<vector<int>>& mat) {
    cout << "[ " << endl;
    for (const auto& row : mat) {
        cout << "  ";
        for (int num : row) {
            cout << num << " ";
        }
        cout << endl;
    }
    cout << "]" << endl;
}

/* 回溯算法：全排列 I */
void backtrack(vector<int>& state, const vector<int>& choices, vector<bool>& selected, vector<vector<int>>& res) {
    // 当状态长度等于元素数量时，记录解
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 剪枝：不允许重复选择元素
        if (!selected[i]) {
            // 尝试：做出选择，更新状态
            selected[i] = true;
            state.push_back(choice);
            // 进行下一轮选择
            backtrack(state, choices, selected, res);
            // 回退：撤销选择，恢复到之前的状态
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

    cout << "输入数组 nums = ";
    printVector(nums);

    vector<vector<int>> res = permutationsI(nums);

    cout << "所有排列结果 = " << endl;
    printVectorMatrix(res);

    return 0;
}
