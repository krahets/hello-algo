
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // When climbing to the nth step, add 1 to the number of solutions
    if (state == n)
        res[0]++;
    // Traverse all choices
    for (auto &choice : choices) {
        // Pruning: do not allow climbing beyond the nth step
        if (state + choice > n)
            continue;
        // Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res);
        // Retract
    }
}

/* Climbing stairs: Backtracking */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Can choose to climb up 1 step or 2 steps
    int state = 0;                // Start climbing from the 0th step
    vector<int> res = {0};        // Use res[0] to record the number of solutions
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "There are " << res << " solutions to climb " << n << " stairs" << endl;

    return 0;
}
