/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング：部分集合和 I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if (total == target) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査する
    for (size_t i = 0; i < choices.size(); i++) {
        // 枝刈り：部分集合の和が target を超える場合、この選択をスキップする
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素の和 total を更新する
        state.push_back(choices[i]);
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop_back();
    }
}

/* 部分集合和 I を解く（重複した部分集合を含む） */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // 状態（部分集合）
    int total = 0;           // 部分集合和
    vector<vector<int>> res; // 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* 実行用コード */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "和が " << target << " になるすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
