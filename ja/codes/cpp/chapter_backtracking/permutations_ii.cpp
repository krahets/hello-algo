/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング：すべての順列 II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 状態の長さが要素数と等しくなったら、解を記録する
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査する
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // 試行：選択を行い、状態を更新する
            duplicated.emplace(choice); // 選択済みの要素の値を記録する
            selected[i] = true;
            state.push_back(choice);
            // 次の選択に進む
            backtrack(state, choices, selected, res);
            // 復元：選択を取り消し、以前の状態に戻す
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* すべての順列 II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* 実行用コード */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "すべての順列 res = ";
    printVectorMatrix(res);

    return 0;
}
