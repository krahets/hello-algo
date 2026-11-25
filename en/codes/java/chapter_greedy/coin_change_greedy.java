/**
 * File: coin_change_greedy.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;

public class coin_change_greedy {
    /* Greedy coin change */
    static int coinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.length - 1;
        int count = 0;
        // Make greedy choices until no amount remains
        while (amt > 0) {
            // Find the closest denomination below the remaining amount
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

    public static void main(String[] args) {
        // Greedy choices are guaranteed to give a global optimum here
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("The minimum number of coins needed to make " + amt + " is " + res);

        // Greedy choices do not guarantee a global optimum here
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("The minimum number of coins needed to make " + amt + " is " + res);
        System.out.println("The actual minimum is 3 coins: 20 + 20 + 20");

        // Greedy choices do not guarantee a global optimum here
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("The minimum number of coins needed to make " + amt + " is " + res);
        System.out.println("The actual minimum is 2 coins: 49 + 49");
    }
}
