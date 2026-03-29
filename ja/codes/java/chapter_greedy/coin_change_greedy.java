/**
 * File: coin_change_greedy.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;

public class coin_change_greedy {
    /* コイン交換：貪欲法 */
    static int coinChangeGreedy(int[] coins, int amt) {
        // coins リストはソート済みと仮定する
        int i = coins.length - 1;
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

    public static void main(String[] args) {
        // 貪欲法：大域最適解を保証できる
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("合計 " + amt + " に必要な最小硬貨枚数は " + res);

        // 貪欲法：大域最適解を保証できない
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("合計 " + amt + " に必要な最小硬貨枚数は " + res);
        System.out.println("実際に必要な最小枚数は 3、つまり 20 + 20 + 20");

        // 貪欲法：大域最適解を保証できない
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("合計 " + amt + " に必要な最小硬貨枚数は " + res);
        System.out.println("実際に必要な最小枚数は 2、つまり 49 + 49");
    }
}
