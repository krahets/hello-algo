/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングアルゴリズム：部分集合和 I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 部分集合の和がtargetと等しいとき、解を記録
    if (total == target) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査
    for (int i = 0; i < choices.size(); i++) {
        // 剪定：部分集合の和がtargetを超えた場合、その選択をスキップ
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素とtotalを更新
        state.push_back(choices[i]);
        // 次のラウンドの選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：選択を取り消し、前の状態に復元
        state.pop_back();
    }
}

/* 部分集合和 I を解く（重複する部分集合を含む） */
vector<vector<int>> subsetSumINaive(vector<int> nums, int target) {
    vector<int> state;       // 状態（部分集合）
    int total = 0;           // 部分集合の和
    vector<vector<int>> res; // 結果リスト（部分集合リスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* ドライバーコード */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "和が " << target << " のすべての部分集合 res = " << endl;
    printVectorMatrix(res);
    cout << "この方法の結果には重複する集合が含まれています" << endl;

    return 0;
}