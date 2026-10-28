
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹 */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if (state == n)
        res[0]++;
    // 모든 선택지를 순회한다
    for (auto &choice : choices) {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if (state + choice > n)
            continue;
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res);
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    int state = 0;                // 0번째 계단에서 오르기 시작한다
    vector<int> res = {0};        // res[0]에 방법의 수를 기록한다
    backtrack(choices, state, n, res);
    return res[0];
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    return 0;
}
