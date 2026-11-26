/**
 * File: coin_change_greedy.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;

public class coin_change_greedy {
    /* 硬貨の両替（貪欲法） */
    static int coinChangeGreedy(int[] coins, int amt) {
        // リスト coins はソート済みとする
        int i = coins.length - 1;
        int count = 0;
        // 残額がなくなるまで貪欲選択を繰り返す
        while (amt > 0) {
            // 残額以下で額面が最大の硬貨を探す
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

    public static void main(String[] args) {
        // 貪欲法で大域的最適解が必ず求まる例
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);

        // 貪欲法では大域的最適解を保証できない例
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);
        System.out.println("実際の最少枚数は 3 枚（20 + 20 + 20）");

        // 貪欲法では大域的最適解を保証できない例
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("金額 " + amt + " を作るのに必要な硬貨の最少枚数は " + res);
        System.out.println("実際の最少枚数は 2 枚（49 + 49）");
    }
}
