/**
 * File: coin_change_greedy.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;

public class coin_change_greedy {
    /* Размен монет: жадный алгоритм */
    static int coinChangeGreedy(int[] coins, int amt) {
        // Список coins предполагается отсортированным
        int i = coins.length - 1;
        int count = 0;
        // Повторяем жадный выбор, пока остаток суммы не обнулится
        while (amt > 0) {
            // Ищем ближайший к остатку номинал среди меньших, чем остаток
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Берём coins[i]
            amt -= coins[i];
            count++;
        }
        // Если решения не нашлось, возвращаем -1
        return amt == 0 ? count : -1;
    }

    public static void main(String[] args) {
        // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для суммы " + amt + " минимальное число монет: " + res);

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для суммы " + amt + " минимальное число монет: " + res);
        System.out.println("На самом деле минимум — 3 монеты: 20 + 20 + 20");

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для суммы " + amt + " минимальное число монет: " + res);
        System.out.println("На самом деле минимум — 2 монеты: 49 + 49");
    }
}
