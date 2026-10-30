/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change: greedy algorithm */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // Assume the coins list is sorted
    int i = coins.size() - 1;
    int count = 0;
    // Repeatedly make greedy choices until no amount remains
    while (amt > 0) {
        // Find the largest coin that does not exceed the remaining amount
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Choose coins[i]
        amt -= coins[i];
        count++;
    }
    // Return -1 if no feasible solution was found
    return amt == 0 ? count : -1;
}

/* Driver code */
int main() {
    // Greedy algorithm: guaranteed to find a globally optimal solution
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "For amount " << amt << " , the greedy coin count is " << res << endl;

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "For amount " << amt << " , the greedy coin count is " << res << endl;
    cout << "The actual minimum is 3 coins: 20 + 20 + 20" << endl;

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "For amount " << amt << " , the greedy coin count is " << res << endl;
    cout << "The actual minimum is 2 coins: 49 + 49" << endl;

    return 0;
}
