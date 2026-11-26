/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* Greedy coin change */
int coinChangeGreedy(int *coins, int size, int amt) {
    // Assume the coins list is sorted
    int i = size - 1;
    int count = 0;
    // Make greedy choices until no amount remains
    while (amt > 0) {
        // Find the largest denomination that does not exceed the remaining amount
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
    // Greedy choices are guaranteed to give a global optimum here
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("The minimum number of coins needed to make %d is %d\n", amt, res);

    // Greedy choices do not guarantee a global optimum here
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("The minimum number of coins needed to make %d is %d\n", amt, res);
    printf("The actual minimum is 3 coins: 20 + 20 + 20\n");

    // Greedy choices do not guarantee a global optimum here
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("The minimum number of coins needed to make %d is %d\n", amt, res);
    printf("The actual minimum is 2 coins: 49 + 49\n");

    return 0;
}
