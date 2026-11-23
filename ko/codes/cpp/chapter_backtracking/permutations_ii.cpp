/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹 알고리즘: 모든 순열 II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // 모든 선택지를 순회한다
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // 가지치기: 원소를 중복하여 선택할 수 없으며, 값이 같은 원소도 중복하여 선택할 수 없다
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // 시도: 선택하고 상태를 갱신한다
            duplicated.emplace(choice); // 선택한 원소의 값을 기록한다
            selected[i] = true;
            state.push_back(choice);
            // 다음 선택을 진행한다
            backtrack(state, choices, selected, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* 모든 순열 II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* 실행 코드 */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "입력 배열 nums = ";
    printVector(nums);
    cout << "모든 순열 res = ";
    printVectorMatrix(res);

    return 0;
}
