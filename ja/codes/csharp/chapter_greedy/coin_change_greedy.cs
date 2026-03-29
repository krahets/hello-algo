/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* コイン交換：貪欲法 */
    int CoinChangeGreedy(int[] coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.Length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲選択を繰り返す
        while (amt > 0) {
            // 残額以下で最も近い硬貨を見つける
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選択する
            amt -= coins[i];
            count++;
        }
        // 実行可能な解が見つからなければ -1 を返す
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // 貪欲法：大域最適解を保証できる
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な最小硬貨枚数は " + res);

        // 貪欲法：大域最適解を保証できない
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な最小硬貨枚数は " + res);
        Console.WriteLine("実際に必要な最小枚数は 3、つまり 20 + 20 + 20");

        // 貪欲法：大域最適解を保証できない
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("金額 " + amt + " を作るのに必要な最小硬貨枚数は " + res);
        Console.WriteLine("実際に必要な最小枚数は 2、つまり 49 + 49");
    }
}