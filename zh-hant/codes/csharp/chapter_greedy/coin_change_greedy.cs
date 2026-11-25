/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* 零錢兌換：貪婪法 */
    int CoinChangeGreedy(int[] coins, int amt) {
        // 假設硬幣清單 coins 已依面額遞增排序
        int i = coins.Length - 1;
        int count = 0;
        // 反覆依貪婪策略選取硬幣，直到剩餘金額為零
        while (amt > 0) {
            // 找出面額小於且最接近剩餘金額的硬幣
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // 選取 coins[i]
            amt -= coins[i];
            count++;
        }
        // 若找不到可行解，則回傳 -1
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // 貪婪法：保證能找到全域最佳解
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊出 " + amt + " 所需的最少硬幣數為 " + res);

        // 貪婪法：無法保證找到全域最佳解
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊出 " + amt + " 所需的最少硬幣數為 " + res);
        Console.WriteLine("實際上最少只需 3 枚，即 20 + 20 + 20");

        // 貪婪法：無法保證找到全域最佳解
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("湊出 " + amt + " 所需的最少硬幣數為 " + res);
        Console.WriteLine("實際上最少只需 2 枚，即 49 + 49");
    }
}