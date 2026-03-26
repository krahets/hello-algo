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
        // Предположим, что список coins упорядочен
        int i = coins.length - 1;
        int count = 0;
        // Повторять жадный выбор, пока не останется суммы
        while (amt > 0) {
            // Найти монету, которая меньше оставшейся суммы и ближе всего к ней
            while (i > 0 && coins[i] > amt) {
                i--;
            }
            // Выбрать coins[i]
            amt -= coins[i];
            count++;
        }
        // Если допустимое решение не найдено, вернуть -1
        return amt == 0 ? count : -1;
    }

    public static void main(String[] args) {
        // Жадный подход: позволяет гарантированно найти глобально оптимальное решение
        int[] coins = { 1, 5, 10, 20, 50, 100 };
        int amt = 186;
        int res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для получения" + amt + "минимальное число монет равно" + res);

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = new int[] { 1, 20, 50 };
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для получения" + amt + "минимальное число монет равно" + res);
        System.out.println("Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20");

        // Жадный подход: не гарантирует нахождение глобально оптимального решения
        coins = new int[] { 1, 49, 50 };
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        System.out.println("\ncoins = " + Arrays.toString(coins) + ", amt = " + amt);
        System.out.println("Для получения" + amt + "минимальное число монет равно" + res);
        System.out.println("Фактически минимальное необходимое количество равно 2, то есть 49 + 49");
    }
}
