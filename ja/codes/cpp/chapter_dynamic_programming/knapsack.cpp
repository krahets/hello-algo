#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* 0-1 ナップサック：総当たり探索 */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0;
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2つの案のうち価値が大きいほうを返す
    return max(no, yes);
}

/* 0-1 ナップサック：メモ化探索 */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0;
    }
    // 既に記録があればそのまま返す
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2 つの案のうち価値が大きい方を記録して返す
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* 0-1 ナップサック：動的計画法 */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp テーブルを初期化
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp テーブルを初期化
    vector<int> dp(cap + 1, 0);
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        // 逆順に走査する
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // 全探索
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "ナップサック容量を超えない最大価値は " << res << endl;

    // メモ化探索
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "ナップサック容量を超えない最大価値は " << res << endl;

    // 動的計画法
    res = knapsackDP(wgt, val, cap);
    cout << "ナップサック容量を超えない最大価値は " << res << endl;

    // 空間最適化後の動的計画法
    res = knapsackDPComp(wgt, val, cap);
    cout << "ナップサック容量を超えない最大価値は " << res << endl;

    return 0;
}
