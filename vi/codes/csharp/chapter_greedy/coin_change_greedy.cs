/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* Coin change: Greedy algorithm */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Assume coins list is sorted
        int i = coins.Length - 1;
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

    [Test]
    public void Test() {
        // Greedy algorithm: Can guarantee finding the global optimal solution
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);

        // Greedy algorithm: Cannot guarantee finding the global optimal solution
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);
        Console.WriteLine("Actually the minimum number needed is 3, i.e., 20 + 20 + 20");

        // Greedy algorithm: Cannot guarantee finding the global optimal solution
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("To make " + amt + ", minimum number of coins needed is " + res);
        Console.WriteLine("Actually the minimum number needed is 2, i.e., 49 + 49");
    }
}