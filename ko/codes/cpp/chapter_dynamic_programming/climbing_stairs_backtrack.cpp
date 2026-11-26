
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹 */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // n번째 계단에 도달하면 방법 수를 1 늘린다
    if (state == n)
        res[0]++;
    // 모든 선택지 순회
    for (auto &choice : choices) {
        // 가지치기: n번째 계단을 넘지 않는다
        if (state + choice > n)
            continue;
        // 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 선택 취소
    }
}

/* 계단 오르기: 백트래킹 */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 한 번에 한 계단 또는 두 계단을 오른다
    int state = 0;                // 0번째 계단에서 출발한다
    vector<int> res = {0};        // res[0]에 방법 수를 기록한다
    backtrack(choices, state, n, res);
    return res[0];
}

/* 실행 예제 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "계단 " << n << " 개를 오르는 방법: " << res << " 가지" << endl;

    return 0;
}
