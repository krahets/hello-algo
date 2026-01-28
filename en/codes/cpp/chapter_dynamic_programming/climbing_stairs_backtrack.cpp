
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // When climbing to the n-th stair, add 1 to the solution count
    if (state == n)
        res[0]++;
    // Traverse all choices
    for (auto &choice : choices) {
        // Pruning: not allowed to go beyond the n-th stair
        if (state + choice > n)
            continue;
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Can choose to climb up 1 or 2 stairs
    int state = 0;                // Start climbing from the 0-th stair
    vector<int> res = {0};        // Use res[0] to record the solution count
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "Climbing " << n << " stairs has " << res << " solutions" << endl;

    return 0;
}
