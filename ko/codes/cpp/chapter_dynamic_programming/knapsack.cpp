#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* 0-1 배낭: 완전 탐색 */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 큰 가치를 반환한다
    return max(no, yes);
}

/* 0-1 배낭: 메모이제이션 탐색 */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 기록이 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* 0-1 배낭: 동적 계획법 */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp 테이블 초기화
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 배낭: 공간 최적화 동적 계획법 */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp 테이블 초기화
    vector<int> dp(cap + 1, 0);
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        // 역순으로 순회
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 실행 예제 */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // 완전 탐색
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "배낭 용량 내에서 얻는 최대 가치: " << res << endl;

    // 메모이제이션 탐색
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "배낭 용량 내에서 얻는 최대 가치: " << res << endl;

    // 동적 계획법
    res = knapsackDP(wgt, val, cap);
    cout << "배낭 용량 내에서 얻는 최대 가치: " << res << endl;

    // 공간 최적화 동적 계획법
    res = knapsackDPComp(wgt, val, cap);
    cout << "배낭 용량 내에서 얻는 최대 가치: " << res << endl;

    return 0;
}
