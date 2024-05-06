#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* 0-1 Knapsack: Brute force search */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the greater value of the two options
    return max(no, yes);
}

/* 0-1 Knapsack: Memoized search */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // If all items have been chosen or the knapsack has no remaining capacity, return value 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // If there is a record, return it
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Record and return the greater value of the two options
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* 0-1 Knapsack: Dynamic programming */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Initialize dp table
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 Knapsack: Space-optimized dynamic programming */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Initialize dp table
    vector<int> dp(cap + 1, 0);
    // State transition
    for (int i = 1; i <= n; i++) {
        // Traverse in reverse order
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // The greater value between not choosing and choosing item i
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

    // Brute force search
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    // Memoized search
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    // Dynamic programming
    res = knapsackDP(wgt, val, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    // Space-optimized dynamic programming
    res = knapsackDPComp(wgt, val, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    return 0;
}
