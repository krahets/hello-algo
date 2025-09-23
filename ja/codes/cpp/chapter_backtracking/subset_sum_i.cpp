/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングアルゴリズム：部分集合和 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 部分集合の和がtargetと等しいとき、解を記録
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査
    // 剪定二：startから走査を開始し、重複する部分集合の生成を回避
    for (int i = start; i < choices.size(); i++) {
        // 剪定一：部分集合の和がtargetを超えた場合、即座にループを終了
        // 配列がソートされているため、後の要素はさらに大きく、部分集合の和は必ずtargetを超える
        if (target - choices[i] < 0) {
            break;
        }
        // 試行：選択を行い、target、startを更新
        state.push_back(choices[i]);
        // 次のラウンドの選択に進む
        backtrack(state, target - choices[i], choices, i, res);
        // 回退：選択を取り消し、前の状態に復元
        state.pop_back();
    }
}

/* 部分集合和 I を解く */
vector<vector<int>> subsetSumI(vector<int> nums, int target) {
    vector<int> state;              // 状態（部分集合）
    sort(nums.begin(), nums.end()); // nums をソート
    int start = 0;                  // 走査の開始点
    vector<vector<int>> res;        // 結果リスト（部分集合リスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* ドライバーコード */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "和が " << target << " のすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}