/**
 * File: edit_distance.cpp
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Edit distance: Brute force search */
int editDistanceDFS(string s, string t, int i, int j) {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0)
        return 0;
    // If s is empty, return the length of t
    if (i == 0)
        return j;
    // If t is empty, return the length of s
    if (j == 0)
        return i;
    // If the two characters are equal, skip these two characters
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return the minimum number of edits
    return min(min(insert, del), replace) + 1;
}

/* Edit distance: Memoized search */
int editDistanceDFSMem(string s, string t, vector<vector<int>> &mem, int i, int j) {
    // If both s and t are empty, return 0
    if (i == 0 && j == 0)
        return 0;
    // If s is empty, return the length of t
    if (i == 0)
        return j;
    // If t is empty, return the length of s
    if (j == 0)
        return i;
    // If there is a record, return it
    if (mem[i][j] != -1)
        return mem[i][j];
    // If the two characters are equal, skip these two characters
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Record and return the minimum number of edits
    mem[i][j] = min(min(insert, del), replace) + 1;
    return mem[i][j];
}

/* Edit distance: Dynamic programming */
int editDistanceDP(string s, string t) {
    int n = s.length(), m = t.length();
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
    // State transition: first row and first column
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // State transition: the rest of the rows and columns
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // If the two characters are equal, skip these two characters
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Edit distance: Space-optimized dynamic programming */
int editDistanceDPComp(string s, string t) {
    int n = s.length(), m = t.length();
    vector<int> dp(m + 1, 0);
    // State transition: first row
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // State transition: the rest of the rows
    for (int i = 1; i <= n; i++) {
        // State transition: first column
        int leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = i;
        // State transition: the rest of the columns
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // If the two characters are equal, skip these two characters
                dp[j] = leftup;
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Update for the next round of dp[i-1, j-1]
        }
    }
    return dp[m];
}

/* Driver Code */
int main() {
    string s = "bag";
    string t = "pack";
    int n = s.length(), m = t.length();

    // Brute force search
    int res = editDistanceDFS(s, t, n, m);
    cout << "Changing " << s << " to " << t << " requires a minimum of " << res << " edits.\n";

    // Memoized search
    vector<vector<int>> mem(n + 1, vector<int>(m + 1, -1));
    res = editDistanceDFSMem(s, t, mem, n, m);
    cout << "Changing " << s << " to " << t << " requires a minimum of " << res << " edits.\n";

    // Dynamic programming
    res = editDistanceDP(s, t);
    cout << "Changing " << s << " to " << t << " requires a minimum of " << res << " edits.\n";

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t);
    cout << "Changing " << s << " to " << t << " requires a minimum of " << res << " edits.\n";

    return 0;
}
