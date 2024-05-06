/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change: Greedy */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Assume coins list is ordered
    int i = coins.size() - 1;
    int count = 0;
    // Loop for greedy selection until no remaining amount
    while (amt > 0) {
        // Find the smallest coin close to and less than the remaining amount
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
    // Greedy: can ensure finding a global optimal solution
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "The minimum number of coins required to make up " << amt << " is " << res << endl;

    // Greedy: cannot ensure finding a global optimal solution
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "The minimum number of coins required to make up " << amt << " is " << res << endl;
    cout << "In reality, the minimum number needed is 3, i.e., 20 + 20 + 20" << endl;

    // Greedy: cannot ensure finding a global optimal solution
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "The minimum number of coins required to make up " << amt << " is " << res << endl;
    cout << "In reality, the minimum number needed is 2, i.e., 49 + 49" << endl;

    return 0;
}
