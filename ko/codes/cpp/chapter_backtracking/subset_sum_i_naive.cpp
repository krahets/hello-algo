/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹 알고리즘: 부분 집합 합 I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (total == target) {
        res.push_back(state);
        return;
    }
    // 모든 선택지를 순회한다
    for (size_t i = 0; i < choices.size(); i++) {
        // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        if (total + choices[i] > target) {
            continue;
        }
        // 시도: 선택하고 원소의 합 total을 갱신한다
        state.push_back(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop_back();
    }
}

/* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // 상태(부분 집합)
    int total = 0;           // 부분 집합의 합
    vector<vector<int>> res; // 결과 리스트(부분 집합 리스트)
    backtrack(state, target, total, nums, res);
    return res;
}

/* 실행 코드 */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "입력 배열 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "부분 집합의 합: " << target << " ; 해당하는 모든 부분 집합 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
