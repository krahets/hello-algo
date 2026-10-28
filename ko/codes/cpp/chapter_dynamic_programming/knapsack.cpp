#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* 0-1 배낭: 완전 탐색 */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 더 큰 가치를 반환한다
    return max(no, yes);
}

/* 0-1 배낭: 메모이제이션을 이용한 탐색 */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 더 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* 0-1 배낭: 동적 계획법 */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp 테이블을 초기화한다
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 배낭: 공간을 최적화한 동적 계획법 */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp 테이블을 초기화한다
    vector<int> dp(cap + 1, 0);
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        // 역방향 순회
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 실행 코드 */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // 완전 탐색
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "배낭 용량을 초과하지 않는 물건의 최대 가치: " << res << endl;

    // 메모이제이션을 이용한 탐색
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "배낭 용량을 초과하지 않는 물건의 최대 가치: " << res << endl;

    // 동적 계획법
    res = knapsackDP(wgt, val, cap);
    cout << "배낭 용량을 초과하지 않는 물건의 최대 가치: " << res << endl;

    // 공간을 최적화한 동적 계획법
    res = knapsackDPComp(wgt, val, cap);
    cout << "배낭 용량을 초과하지 않는 물건의 최대 가치: " << res << endl;

    return 0;
}
