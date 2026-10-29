/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* 硬貨の両替：貪欲法 */
    int CoinChangeGreedy(int[] coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.Length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲な選択を繰り返す
        while (amt > 0) {
            // 残額より小さく、残額に最も近い硬貨を探す
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // coins[i] を選ぶ
            amt -= coins[i];
            count++;
        }
        // 実行可能な方法が見つからなかった場合、-1 を返す
        return amt == 0 ? count : -1;
    }

    [Test]
    public void Test() {
        // 貪欲法：大域的最適解が得られることを保証できる
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("目標金額 " + amt + " にするために必要な硬貨の最小枚数は " + res);

        // 貪欲法：大域的最適解が得られることを保証できない
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("目標金額 " + amt + " にするために必要な硬貨の最小枚数は " + res);
        Console.WriteLine("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20");

        // 貪欲法：大域的最適解が得られることを保証できない
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("目標金額 " + amt + " にするために必要な硬貨の最小枚数は " + res);
        Console.WriteLine("実際に必要な最小枚数は 2 、すなわち 49 + 49");
    }
}