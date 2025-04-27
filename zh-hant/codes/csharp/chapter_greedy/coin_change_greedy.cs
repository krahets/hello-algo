﻿/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* 零錢兌換：貪婪 */
    int CoinChangeGreedy(int[] coins, int amt) {
        // 假設 coins 串列有序
        int i = coins.Length - 1;
        int count = 0;
        // 迴圈進行貪婪選擇，直到無剩餘金額
        while (amt > 0) {
            // 找到小於且最接近剩餘金額的硬幣
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // 選擇 coins[i]
            amt -= coins[i];
            count++;
        }
        // 若未找到可行方案，則返回 -1
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // 貪婪：能夠保證找到全域性最優解
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊到 " + amt + " 所需的最少硬幣數量為 " + res);

        // 貪婪：無法保證找到全域性最優解
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊到 " + amt + " 所需的最少硬幣數量為 " + res);
        Console.WriteLine("實際上需要的最少數量為 3 ，即 20 + 20 + 20");

        // 貪婪：無法保證找到全域性最優解
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊到 " + amt + " 所需的最少硬幣數量為 " + res);
        Console.WriteLine("實際上需要的最少數量為 2 ，即 49 + 49");
    }
}