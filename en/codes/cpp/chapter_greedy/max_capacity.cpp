/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Maximum capacity: Greedy */
int maxCapacity(vector<int> &ht) {
    // Initialize i, j, making them split the array at both ends
    int i = 0, j = ht.size() - 1;
    // Initial maximum capacity is 0
    int res = 0;
    // Loop for greedy selection until the two boards meet
    while (i < j) {
        // Update maximum capacity
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // Move the shorter board inward
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // Greedy algorithm
    int res = maxCapacity(ht);
    cout << "The maximum capacity is " << res << endl;

    return 0;
}
