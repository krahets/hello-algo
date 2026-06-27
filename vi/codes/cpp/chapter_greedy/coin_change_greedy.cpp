/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change: Greedy algorithm */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Assume coins list is sorted
    int i = coins.size() - 1;
    int count = 0;
    // Loop to make greedy choices until no remaining amount
    while (amt > 0) {
        // Find the coin that is less than and closest to the remaining amount
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Choose coins[i]
        amt -= coins[i];
        count++;
    }
    // If no feasible solution is found, return -1
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // Greedy algorithm: Can guarantee finding the global optimal solution
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;
    cout << "Actually the minimum number needed is 3, i.e., 20 + 20 + 20" << endl;

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "Minimum number of coins needed to make " << amt << " is " << res << endl;
    cout << "Actually the minimum number needed is 2, i.e., 49 + 49" << endl;

    return 0;
}
