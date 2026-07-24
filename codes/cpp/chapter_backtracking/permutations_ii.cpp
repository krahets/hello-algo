/**
 * File: permutations_ii.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <unordered_set>
using namespace std;

/* 打印一维数组 */
void printVector(const vector<int>& vec) {
    cout << "[ ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << "]" << endl;
}

/* 打印二维数组（排列结果） */
void printVectorMatrix(const vector<vector<int>>& mat) {
    cout << "[" << endl;
    for (const auto& row : mat) {
        cout << "  ";
        printVector(row);
    }
    cout << "]" << endl;
}

/* 回溯算法：全排列 II（带重复元素去重）*/
void backtrack(vector<int>& state, const vector<int>& choices, vector<bool>& selected, vector<vector<int>>& res) {
    // 当状态长度等于元素数量时，记录解
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }

    // 本层去重集合：同一层不选相同数字
    unordered_set<int> duplicated;

    // 遍历所有选择
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];

        // 剪枝：不重复选同一个位置 + 不选相同数字
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // 记录当前层已经选过这个数字
            duplicated.insert(choice);

            // 选择
            selected[i] = true;
            state.push_back(choice);

            // 下一层
            backtrack(state, choices, selected, res);

            // 撤销
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* 全排列 II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 1, 2};

    cout << "输入数组 nums = ";
    printVector(nums);

    vector<vector<int>> res = permutationsII(nums);

    cout << "所有不重复排列 = " << endl;
    printVectorMatrix(res);

    return 0;
}
