/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング：部分和 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 部分集合の和が target に等しければ、解を記録
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を走査
    // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    for (int i = start; i < choices.size(); i++) {
        // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break;
        }
        // 試す：選択を行い、target と start を更新
        state.push_back(choices[i]);
        // 次の選択へ進む
        backtrack(state, target - choices[i], choices, i, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop_back();
    }
}

/* 部分和 I を解く */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // 状態（部分集合）
    sort(nums.begin(), nums.end()); // nums をソート
    int start = 0;                  // 開始点を走査
    vector<vector<int>> res;        // 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "合計が " << target << " に等しいすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
