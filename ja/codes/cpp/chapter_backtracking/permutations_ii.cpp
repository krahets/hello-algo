/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングによる全順列 II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 状態の長さが要素数に達したら解を記録する
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を調べる
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // 試行：選択して状態を更新する
            duplicated.emplace(choice); // 選んだ要素の値を記録する
            selected[i] = true;
            state.push_back(choice);
            // 次の選択に進む
            backtrack(state, choices, selected, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* 全順列 II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* 実行例 */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "すべての順列 res = ";
    printVectorMatrix(res);

    return 0;
}
