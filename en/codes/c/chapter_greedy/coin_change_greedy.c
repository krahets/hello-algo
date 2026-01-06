/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* Coin change: Greedy algorithm */
int coinChangeGreedy(int *coins, int size, int amt) {
    // Assume coins list is sorted
    int i = size - 1;
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
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("Minimum number of coins needed to make %d is %d\n", amt, res);

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("Minimum number of coins needed to make %d is %d\n", amt, res);
    printf("Actually minimum needed is 3, i.e., 20 + 20 + 20\n");

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("Minimum number of coins needed to make %d is %d\n", amt, res);
    printf("Actually minimum needed is 2, i.e., 49 + 49\n");

    return 0;
}
