/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* Coin change: greedy algorithm */
int coinChangeGreedy(int *coins, int size, int amt) {
    // Assume the coins list is sorted
    int i = size - 1;
    int count = 0;
    // Repeatedly make greedy choices until no amount remains
    while (amt > 0) {
        // Find the largest coin no greater than the remaining amount
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
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("Greedy coin count for amount %d: %d\n", amt, res);

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("Greedy coin count for amount %d: %d\n", amt, res);
    printf("The actual minimum is 3 coins: 20 + 20 + 20\n");

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("Greedy coin count for amount %d: %d\n", amt, res);
    printf("The actual minimum is 2 coins: 49 + 49\n");

    return 0;
}
