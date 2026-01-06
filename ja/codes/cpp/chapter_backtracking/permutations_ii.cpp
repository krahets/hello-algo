/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングアルゴリズム：順列 II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 状態の長さが要素数と等しくなったら、解を記録
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 剪定：要素の重複選択を許可せず、等しい要素の重複選択も許可しない
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // 試行：選択を行い、状態を更新
            duplicated.emplace(choice); // 選択された要素値を記録
            selected[i] = true;
            state.push_back(choice);
            // 次のラウンドの選択に進む
            backtrack(state, choices, selected, res);
            // 回退：選択を取り消し、前の状態に復元
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* 順列 II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* ドライバーコード */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "すべての順列 res = ";
    printVectorMatrix(res);

    return 0;
}