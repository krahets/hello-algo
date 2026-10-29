/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング：部分集合和 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 部分集合の和が target と等しくなったら、解を記録する
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査する
    // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    for (int i = start; i < choices.size(); i++) {
        // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
        if (target - choices[i] < 0) {
            break;
        }
        // 試行：選択を行い、target, start を更新する
        state.push_back(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i, res);
        // 復元：選択を取り消し、以前の状態に戻す
        state.pop_back();
    }
}

/* 部分集合和 I を解く */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // 状態（部分集合）
    sort(nums.begin(), nums.end()); // nums をソートする
    int start = 0;                  // 走査の開始位置
    vector<vector<int>> res;        // 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 実行用コード */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "和が " << target << " になるすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
