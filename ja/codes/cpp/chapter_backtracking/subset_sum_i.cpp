/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングによる部分和問題 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // すべての選択肢を調べる
    // 枝刈り 2：start から調べて部分集合の重複を防ぐ
    for (int i = start; i < choices.size(); i++) {
        // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
        // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
        if (target - choices[i] < 0) {
            break;
        }
        // 試行：選択して target と start を更新する
        state.push_back(choices[i]);
        // 次の選択に進む
        backtrack(state, target - choices[i], choices, i, res);
        // 後戻り：選択を取り消し、元の状態に戻す
        state.pop_back();
    }
}

/* 部分和問題 I を解く */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // 状態（部分集合）
    sort(nums.begin(), nums.end()); // nums をソートする
    int start = 0;                  // 走査の開始位置
    vector<vector<int>> res;        // 結果のリスト（部分集合のリスト）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 実行例 */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "入力配列 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "要素の和が " << target << " となるすべての部分集合 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
