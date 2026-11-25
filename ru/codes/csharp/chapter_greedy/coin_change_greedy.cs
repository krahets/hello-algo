/**
* File: coin_change_greedy.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class coin_change_greedy {
    /* Размен монет: жадный алгоритм */
    int CoinChangeGreedy(int[] coins, int amt) {
        // Список coins предполагается отсортированным
        int i = coins.Length - 1;
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

    [Test]
    public void Test() {
        // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
        int[] coins = [1, 5, 10, 20, 50, 100];
        int amt = 186;
        int res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Для суммы " + amt + " минимальное число монет: " + res);

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = [1, 20, 50];
        amt = 60;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Для суммы " + amt + " минимальное число монет: " + res);
        Console.WriteLine("На самом деле минимум — 3 монеты: 20 + 20 + 20");

        // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
        coins = [1, 49, 50];
        amt = 98;
        res = CoinChangeGreedy(coins, amt);
        Console.WriteLine("\ncoins = " + coins.PrintList() + ", amt = " + amt);
        Console.WriteLine("Для суммы " + amt + " минимальное число монет: " + res);
        Console.WriteLine("На самом деле минимум — 2 монеты: 49 + 49");
    }
}