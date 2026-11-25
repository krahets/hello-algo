
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // Count one more way when we reach stair n
    if (state == n)
        res[0]++;
    // Iterate over all choices
    for (auto &choice : choices) {
        // Prune moves that would overshoot stair n
        if (state + choice > n)
            continue;
        // Try a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Each move can climb 1 or 2 stairs
    int state = 0;                // Start at stair 0
    vector<int> res = {0};        // Store the number of ways in res[0]
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "Climbing " << n << " stairs: " << res << " ways" << endl;

    return 0;
}
