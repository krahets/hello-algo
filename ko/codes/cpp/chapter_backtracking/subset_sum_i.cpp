/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹: 부분집합의 합 I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // 부분집합의 합이 target과 같으면 해를 기록한다
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 같은 부분집합이 중복 생성되는 것을 막는다
    for (int i = start; i < choices.size(); i++) {
        // 가지치기 1: 부분집합의 합이 target을 초과하면 즉시 반복을 끝낸다
        // 배열이 정렬되어 뒤의 원소가 더 크므로 부분집합의 합이 반드시 target을 초과한다
        if (target - choices[i] < 0) {
            break;
        }
        // 시도: 원소를 선택하고 target과 start를 갱신한다
        state.push_back(choices[i]);
        // 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i, res);
        // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
        state.pop_back();
    }
}

/* 부분집합의 합 I 풀기 */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // 상태(부분집합)
    sort(nums.begin(), nums.end()); // nums를 정렬한다
    int start = 0;                  // 순회 시작점
    vector<vector<int>> res;        // 결과 리스트(부분집합의 리스트)
    backtrack(state, target, nums, start, res);
    return res;
}

/* 실행 코드 */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "입력 배열 nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "목표 합: " << target << " 조건을 만족하는 모든 부분집합 res = " << endl;
    printVectorMatrix(res);

    return 0;
}
