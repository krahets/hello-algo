/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング：部分和 I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 部分集合の和が target に等しければ、解を記録
    if (total == target) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査
    for (size_t i = 0; i < choices.size(); i++) {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素と total を更新する
        state.push_back(choices[i]);
        // 次の選択へ進む
        backtrack(state, target, total + choices[i], choices, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop_back();
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // 状態（部分集合）
    int total = 0;           // 部分和
    vector<vector<int>> res; // 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "合計が " << target << " に等しいすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
