/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Maximum container capacity: greedy algorithm */
int maxCapacity(vector<int> &ht) {
    // Initialize i and j at opposite ends of the array
    int i = 0, j = ht.size() - 1;
    // The initial maximum capacity is 0
    int res = 0;
    // Repeatedly make greedy choices until the two sides meet
    while (i < j) {
        // Update the maximum capacity
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // Move the shorter side inward
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // Greedy algorithm
    int res = maxCapacity(ht);
    cout << "Maximum capacity: " << res << endl;

    return 0;
}
