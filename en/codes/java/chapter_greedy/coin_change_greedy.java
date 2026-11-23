/**
 * File: coin_change_greedy.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;

public class coin_change_greedy {
    /* Coin change: greedy algorithm */
    static int coinChangeGreedy(int[] coins, int amt) {
        // Assume the coins list is sorted
        int i = coins.length - 1;
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

    public static void main(String[] args) {
        // Greedy algorithm: guaranteed to find a globally optimal solution
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("For amount " + amt + " the greedy coin count is " + res);

        // Greedy algorithm: not guaranteed to find a globally optimal solution
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("For amount " + amt + " the greedy coin count is " + res);
        System.out.println("The actual minimum is 3 coins: 20 + 20 + 20");

        // Greedy algorithm: not guaranteed to find a globally optimal solution
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("For amount " + amt + " the greedy coin count is " + res);
        System.out.println("The actual minimum is 2 coins: 49 + 49");
    }
}
