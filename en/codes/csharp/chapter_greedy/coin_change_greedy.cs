/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* Coin change: Greedy */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Assume coins list is ordered
        int i = coins.Length - 1;
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

    [Test]
    public void Test() {
        // Greedy: can ensure finding a global optimal solution
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("The minimum number of coins required to make up " + amt + " is" + res);

        // Greedy: cannot ensure finding a global optimal solution
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("The minimum number of coins required to make up " + amt + " is" + res);
        Console.WriteLine("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20");

        // Greedy: cannot ensure finding a global optimal solution
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("The minimum number of coins required to make up " + amt + " is" + res);
        Console.WriteLine("In reality, the minimum number needed is 2, i.e., 49 + 49");
    }
}