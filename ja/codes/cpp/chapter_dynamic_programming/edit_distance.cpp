/**
 * File: edit_distance.cpp
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 編集距離：ブルートフォース探索 */
int editDistanceDFS(string s, string t, int i, int j) {
    // s と t の両方が空の場合、0 を返す
    if (i == 0 && j == 0)
        return 0;
    // s が空の場合、t の長さを返す
    if (i == 0)
        return j;
    // t が空の場合、s の長さを返す
    if (j == 0)
        return i;
    // 2つの文字が等しい場合、これら2つの文字をスキップ
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集数 = 3つの操作（挿入、削除、置換）からの最小編集数 + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集数を返す
    return min(min(insert, del), replace) + 1;
}

/* 編集距離：動的プログラミング */
int editDistanceDP(string s, string t) {
    int n = s.length(), m = t.length();
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
    // 状態遷移：最初の行と最初の列
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 状態遷移：残りの行と列
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // 2つの文字が等しい場合、これら2つの文字をスキップ
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最小編集数 = 3つの操作（挿入、削除、置換）からの最小編集数 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* ドライバーコード */
int main() {
    string s = "bag";
    string t = "pack";
    int n = s.length(), m = t.length();

    // ブルートフォース探索
    int res = editDistanceDFS(s, t, n, m);
    cout << s << " を " << t << " に変更するには最低 " << res << " 回の編集が必要です" << endl;

    // 動的プログラミング
    res = editDistanceDP(s, t);
    cout << s << " を " << t << " に変更するには最低 " << res << " 回の編集が必要です" << endl;

    return 0;
}