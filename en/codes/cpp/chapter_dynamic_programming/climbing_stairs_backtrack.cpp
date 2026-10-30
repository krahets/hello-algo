
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // When step n is reached, increase the number of ways by 1
    if (state == n)
        res[0]++;
    // Iterate over all choices
    for (auto &choice : choices) {
        // Prune: do not go beyond step n
        if (state + choice > n)
            continue;
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Choose to climb 1 or 2 steps
    int state = 0;                // Start climbing from step 0
    vector<int> res = {0};        // Use res[0] to record the number of ways
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
