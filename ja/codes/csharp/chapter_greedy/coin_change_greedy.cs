/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* 硬貨の両替（貪欲法） */
    int CoinChangeGreedy(int[] coins, int amt) {
        // リスト coins はソート済みとする
        int i = coins.Length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、最も近い額面の硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 解が見つからなければ -1 を返す
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // 貪欲法で大域的最適解が必ず求まる例
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);

        // 貪欲法では大域的最適解を保証できない例
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);
        Console.WriteLine("実際の最少枚数は 3 枚（20 + 20 + 20）");

        // 貪欲法では大域的最適解を保証できない例
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);
        Console.WriteLine("実際の最少枚数は 2 枚（49 + 49）");
    }
}